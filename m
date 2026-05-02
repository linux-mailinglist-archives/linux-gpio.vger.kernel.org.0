Return-Path: <linux-gpio+bounces-35981-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WHocEc729WlvQwIAu9opvQ
	(envelope-from <linux-gpio+bounces-35981-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 02 May 2026 15:06:22 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A5E554B2152
	for <lists+linux-gpio@lfdr.de>; Sat, 02 May 2026 15:06:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7FA653010394
	for <lists+linux-gpio@lfdr.de>; Sat,  2 May 2026 13:06:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 028773806BD;
	Sat,  2 May 2026 13:06:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rKxrA4Ip"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 707D433D4FD
	for <linux-gpio@vger.kernel.org>; Sat,  2 May 2026 13:06:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777727174; cv=pass; b=M7DN7b9yejok17us4okmo0ZTUMJCk0+qxcoWsoKQ3GxQBO/JrOGWHF7UbgKMsAUsKaMo0NuuMA8vsxGN/S+YViY/4Auy/wgpUd100ejJwM65dGKf1XbYSIzbLBXNe9J+BduM0yRNMwsMOswKdezhnXMRijqcKk/aAUePSECFEtg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777727174; c=relaxed/simple;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=jwNRtdYzOrb6tI1+NZqt96BoCX+EbbFXNOW/LlawzlVotfPqcTWAQrqBTlHOWOEgknufOekILGQAcW4n3koNDGISO+MxikGFK7CqCSCEb6R1xaxo1t9l4W1J92QIn8S7cAXmnM2lK+1hG5TQqtFbo2Em84b9bR8yZk3+w3hinTg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rKxrA4Ip; arc=pass smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4891c00e7aeso21182115e9.2
        for <linux-gpio@vger.kernel.org>; Sat, 02 May 2026 06:06:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777727171; cv=none;
        d=google.com; s=arc-20240605;
        b=R1c1Kpos98i1VXRtOFKd3IPuqNwSVn684JwzvZgR6cDPMw6uJlYIfQcr8HdOuFBT+3
         LodM5Qiazls5DSvaYKGe4iAvm1HwGuVjfMswM5dedKc3JN6pXKHKwH1HTcEw8mM11lgp
         pM8/ICM2meOSZwdjjwF64zyj1ozqSXQQd8V/jWLHpKipJpe/fQ5HWyhNBYJgzJ9JnyiQ
         NR+W5hObidCmOU7F8SGRXeMozyEWHwoijijIkZwFtAFl075OEPglqTfyb553Oyts0tWQ
         xzOUHHmjQIU0VgWPgdjk0eR2r2ioOCiC0gkKk/K1sevHeFZK/eOJVprvonxnfYHh85Zx
         kIjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
        fh=wme3R0kehEfc9nCbc8GNEWaZY2q8y+qi2lMansKtfUA=;
        b=U/BzDUZ7o0ba174tpK35cj54edJdxcsAqFWDFUtqSsm8Xmqh4bHWo7GLFxKt0fSAH5
         dnpuQp3uEAiSsAXvTFCLh3HeEyTpdhORv08R7uEHaoTjAXv9y4G6836L3eicWKcH5AFo
         jRhNSd/WCM3M6jZqGBp9mCuzdh+YTwSsDdhxVDzoVix+DNnX3Zoa0suE2Wot8dzNAA1+
         S+ym+SLIlKeR6vhZAUlHlVjL2xenwTFHy3ft9SqbhYt2TQKv2y1+2P2gYTCbujf7Ky7s
         B+epArm+ZK0C87iAB2J/tBRKxgoDsySgLBBUsIt1GRFzkIZBYlX2HQV+x+smEpNXdvnd
         PoHw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777727171; x=1778331971; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
        b=rKxrA4IpDIebmmpDkvM+eDGcr8bPlhUU5V2ldw/pt9hWAvzS/UHrXPX+JT65hjRoVz
         dzC7tCus3bTHJB+HfWG9WaZlRuKcghJQmVB0IvesA+7u30Nd4slwwZRCVHW5X7mkq6gT
         R/zOyapfkQ1yeSaLZTsRDKYbE290r2Jj4pmn1Dp+ndFSyn6+KdJWm0jmYGy92l3RtCLo
         oQ2lzmmb5OCIqkEM83Gnm/eoJJKvuJ3frPBvOJvGlTanqXCShUcl+D4q2P5PVWKAcV5e
         B88pxtB6F4AN7gh5ARioyqpyMwawaFjCDUrn/+O6VJxplviphJ+XjEhBd/b9bYbo82De
         Thmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777727171; x=1778331971;
        h=to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
        b=pr6OZBf7egwycSvZN+RhofdaeRh1qLyDjOb9SuIoy2TQ9H3aAT2ZolqXGC2Yk+NPRO
         JlUo/LVgWjhE9h/fOcqLDHwq+kYdnyE9cpvZo2buQOJ1XLxp3fLF9ogcTIptOoHko+M/
         Tamn4yeqOXvoFJlOCsLpvekFw9Jqw2n5/pkFZxEcSytdvdH8K16KSPaMSJWAg5pvArD7
         PVgJL22Rdom6l1g/sDOg8xS/qH1PNV/wswNQOQf91lvPqy2CPNsalNvoTzqRnLptBvBw
         fXVUcgc1A4l4xLERH9XtAq9Kak2ZUA3FCmj6TiL8ki+4iuHGaOfeVAzrYsBsf448gLKF
         y47w==
X-Gm-Message-State: AOJu0YzT64FBj2yL+SjeoY/uQmMJgr1l0fZW3jJ79prZ/qe69oChwc/E
	/koK9CEKg2PXIK2Oq3j4NMLKbgpOYFOojv5Oa0zvUZZSbdW9jKeLvHDej2gFEFUkBjXqDqb2wvN
	iHcioOP4mVLxDhz4foKH1u0BlvGEk5VCa8Q==
X-Gm-Gg: AeBDiethme93NAE9ZnRUiIQu+qJo/LCol1vbX4gezeEx1EoYczm+1MXC4ZmCslkA8V8
	DS2SFqgI0l9EB280T9Xaykj0Uyr46Y+tNdJ1h5+wJMy9ujC3Ng5PxaMtybjrpORDKzObVI7Un2n
	svcNEwl7BIRBEMPgG0FRyp4dvfswn/z5PFMqb+vSpi2yqMd2p83kAqCgHpruz0q1PWfzZ1DXxbI
	S3fRU8O46tpQmT6+GoEc9wIdqzxTs2ITUGYrssrLnUxqOCKkxp6w3bT3Xu5A1Rw088Ts2egWmLJ
	8ru01WgPEG6f6+/+xc4=
X-Received: by 2002:a05:600c:4712:b0:488:b241:2c5f with SMTP id
 5b1f17b1804b1-48a9867501emr38461605e9.26.1777727170667; Sat, 02 May 2026
 06:06:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Ramon Fried <rfried.dev@gmail.com>
Date: Sat, 2 May 2026 16:05:58 +0300
X-Gm-Features: AVHnY4LZo0ERS8-xPJFUINzLdBeDMb7jMokEv212dOYuQpkjHYb8Q2RqSaV2acs
Message-ID: <CAGi-RUKgyFUR3DCXYvd-SydaN4o-M=-aEyoF-RUw7HtAyL66mg@mail.gmail.com>
Subject: unsubscribe
To: linux-gpio <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: A5E554B2152
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:subspace.kernel.org:reject}];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	TAGGED_FROM(0.00)[bounces-35981-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_ONE(0.00)[1];
	FREEMAIL_FROM(0.00)[gmail.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rfrieddev@gmail.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	SINGLE_SHORT_PART(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]



