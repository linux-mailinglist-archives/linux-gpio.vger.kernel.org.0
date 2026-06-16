Return-Path: <linux-gpio+bounces-38515-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id G6yUCd+UMGrVUgUAu9opvQ
	(envelope-from <linux-gpio+bounces-38515-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jun 2026 02:12:15 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 79D3168AD6B
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jun 2026 02:12:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=gyYop1jk;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38515-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38515-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A2D3F305B4B2
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jun 2026 00:07:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3457278C9C;
	Tue, 16 Jun 2026 00:07:14 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C1582DF68
	for <linux-gpio@vger.kernel.org>; Tue, 16 Jun 2026 00:07:12 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781568434; cv=none; b=e/M/drs2crbjH8bwXolIQ1CkGg/LaUjzl51PhmXRwA5RW8yxG+k5iIBjY9LzNZ8C6Zk6Sn/aFdCF7KHzezNiPsHKWYmu1WKOMR3KtswPXfFXdLZNOg5TIVPUkKUWaVDz3LjsAJw2Qynvtpeg6PRCxbVirugg7gWiAEYDWvb70qU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781568434; c=relaxed/simple;
	bh=YOcr3LB7Uc9xkwFYfMBhDukTGI24xlGqsTYOcX+rd+I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=bk158OnPc2xwjeF9uhvDXjOWtv3hckHQzC8+C035PdWFHF9+/ky1GG9f5lNY9a01fR7gNdFGTq+b4PlcvDP7/3+aWiz5mcdPU10R7+mWHozkmM4cmPBeVxUL9esPKVx+9kJedG87N11lvRfWZTE96wAAgxAzw14Kn7Thc/4iq2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gyYop1jk; arc=none smtp.client-ip=209.85.210.174
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-84226d0f1d2so2710103b3a.1
        for <linux-gpio@vger.kernel.org>; Mon, 15 Jun 2026 17:07:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781568432; x=1782173232; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YOcr3LB7Uc9xkwFYfMBhDukTGI24xlGqsTYOcX+rd+I=;
        b=gyYop1jkDI3kpB2mkGB4t1kSf5rfrvV3A3+2mKQVPvOXlSB99IP9M0bJX/dbr71CJe
         w4PIUZJKEkukDhHn/jCaMDHhFvujjUmU4IGNJhShoBQ64EwnoFvqrJpzhby/MBK8HutO
         3Dt/3YHvs7cOPoH1m11B8wL1jlAXvyRnwyqG1d45epZtL3ZrzHhrGH1b9KlhRaNLFEJA
         nWS8z6dp6KmgPBATrpOjtvB9+ZIiIO/JXIVglJcxe4yCAHy9hN/DPche4YJP3ddGSTTA
         vHnsY74RoGVgGfs3o+zXRld16cAeUy5VhoyL5Jbce2YarBMGKWtGeL85azXl93L6Dyad
         od8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781568432; x=1782173232;
        h=mime-version:content-transfer-encoding:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YOcr3LB7Uc9xkwFYfMBhDukTGI24xlGqsTYOcX+rd+I=;
        b=Xaq62TuVE+54tMW6Tjkg6SAkehupnlDGp7/GMicg+jhqfm/CskNfaGIBKegT/G6GhH
         BLMeaMCIYlyoS2u/Ly29H1wsjQwHYMTPpjKyLjRydSd76Y1dGQlofM6m6OdwInbD7Q3+
         7IjIqFviFQYBD52AgDouP62wBQgoU4sqfmNtGIVPU/hNfvSKZDqQwfzpfegPrXpDgZ5o
         sy8cRR6Coz6+MUF8JLrpdWKI978n4vTmDArTg7UvCPw7B43J3WdSUiiXMnsjadjTWgIC
         gZ0vKnmh4xjVpu/W9a/RNia4JHtQPHiJTRcuCMcoNszQwOY9hojwc+/JKQJSnrFu6hzH
         Q+Ig==
X-Gm-Message-State: AOJu0YzNMv1vblKbBp4ugg0t9hTn+GJn9AyfK/cyvLLCzNuUTuCJIzkq
	zWA2fs3I3v2RHnP7stQOyyO0WOqBaSwWH1Cicf8WV3RWCEmalnHuMNk+W5vG62xC
X-Gm-Gg: Acq92OELwabeXbceC8JbIddMIW8nJjb1GWGis5HBJ5bcQ8Wn8MTNQODsSWg3e412nIk
	fcVzPefjwGBG92iuSXSQYnkRpFT+eCTfSR3JCpkCr2AGOQT/huHtMJYMY0lG3RrkxRZ/Z6dPZES
	IZlnU1Y9FAcnLkr4ISd6DZ98KaIziKEu/DHXmOMP53tY4gC5vKtRahHYAOVWtzjUW7Cxb22FB62
	boD2AjvCp8J/c9L3oP7we73B0/FCmqy6F4bfOlFfUQ3OzoDKWJCZACjpzA7iYM5KMd/zYlGhSc2
	kwS6zABEqI+acEXXv4+Uz6vf3Z1q82oN5fjscK0leAnC4R7rbu0IygERbhG9l55iw7Tfd1+BmEz
	gxIyxNE+T+NgVCHm6O8EVrRy23YgqXj4+IYEfTCOf2+xFr4Pna9/evGgmofWAQ04gts0cfsft04
	5vLpdgiATvSrhNVuc6tXM=
X-Received: by 2002:a05:6a00:1d99:b0:83f:a040:a3d3 with SMTP id d2e1a72fcca58-8434cec7839mr15643800b3a.43.1781568432296;
        Mon, 15 Jun 2026 17:07:12 -0700 (PDT)
Received: from [127.0.1.1] ([58.240.122.156])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434afc8a84sm13082105b3a.38.2026.06.15.17.07.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 17:07:11 -0700 (PDT)
From: Wayen Yan <win847@gmail.com>
To: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Cc: linux-gpio@vger.kernel.org, Lorenzo Bianconi <lorenzo@kernel.org>
Subject: Re: [06/11] pinctrl: airoha: an7583: fix incorrect led mapping in
 phy4_led1 pin function
Date: Tue, 16 Jun 2026 08:07:08 +0800
Message-ID: <178156842851.2119917.15186316459651679819@gmail.com>
In-Reply-To: <6477a7b8-f8e9-4db1-a5bf-921b10965c8f@iopsys.eu>
References: <20260606020342.1256509-7-mikhail.kshevetskiy@iopsys.eu>
 <6a2ffcc6.2afc2531.35ffc5.cfba@mx.google.com>
 <6477a7b8-f8e9-4db1-a5bf-921b10965c8f@iopsys.eu>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38515-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[win847@gmail.com,linux-gpio@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mikhail.kshevetskiy@iopsys.eu,m:linux-gpio@vger.kernel.org,m:lorenzo@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[win847@gmail.com,linux-gpio@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[3];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 79D3168AD6B

On 6/15/26 19:19, Mikhail Kshevetskiy wrote:
> This is a previous patch in a series, isn't it?

Right, PATCH 05/11 already covers the EN7581 phy4_led1 fix. Sorry for
the noise, I missed that when reviewing the series.

Regards,
Wayen

