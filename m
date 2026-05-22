Return-Path: <linux-gpio+bounces-37384-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AP9HNuK7EGomdAYAu9opvQ
	(envelope-from <linux-gpio+bounces-37384-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 22 May 2026 22:26:10 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 830FC5BA06B
	for <lists+linux-gpio@lfdr.de>; Fri, 22 May 2026 22:26:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 365363024F8E
	for <lists+linux-gpio@lfdr.de>; Fri, 22 May 2026 20:25:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA4F93815F7;
	Fri, 22 May 2026 20:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WE+BWjq6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4365538330E
	for <linux-gpio@vger.kernel.org>; Fri, 22 May 2026 20:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779481494; cv=pass; b=lMcVC2LE2wSkdw2SIm6z8N1rJVU5pz//smNeDnJ0djcZFtuUqxtnlKm/i50DTQWOh94UGRCMpqU6C4FRbzEGRDnk5UEQHDRg0JzX7pbtU/ItKT1Yc7i/WbvAs3iR1nVNNvaja1aXKlcrd1g3eRumXOzpJcybOgE2oVYVRm1rMWA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779481494; c=relaxed/simple;
	bh=hFhe67BG9PlnxPfcNP6FKf3sDq8c3UkBXd/zVqXiQbk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YK9IJmhjY3M6/YSwDyVkwl4aofHyrHaWGTfgQyE4IR35I2oYyqmXMIgj5JptvHsbdK/yOCf8cn92Bjxdsuvh3s0E7vVvHucgt7KICDxn7ARav4hWCJ11goEJ7VdAuCEJQEC8n75hnEda1dDvR3QVfK0aVHIGw+tH0WPX+tcQrDU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WE+BWjq6; arc=pass smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-7c23248f3a3so85154207b3.1
        for <linux-gpio@vger.kernel.org>; Fri, 22 May 2026 13:24:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779481492; cv=none;
        d=google.com; s=arc-20240605;
        b=Qxp3Rxglioey25jQMzEIUZ0iUeKW3rSRdTk30+NvaoC2p/MFwHNWYDXj03uKTHPdEU
         F5/n2wLoRS6JL5xUX1+XrI5VVpxqVd+Ux15yuXjcLxDkgD8TX+ws/Ogh3w/tXRLkbzsu
         TkMoMQprJpQsjL+Sr4wl0YES1NepZ7sgWzuoFI6KbOfZxJPiEj6Q7t1EmCJH65tpJ7wL
         TX0tpgWlj/lFkc3mNjHu3IkI+SP5ti/nsJuDjEHm4nMxNAK1Gl2V4jPSOxtVBxRC7G6F
         IuvDySVdgxsaYa1mq6UOHam0sQasLhtqH1aPfaEN+ZI3K0Ec4hH+gdA+CN5Qto6f/mbr
         m+NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hFhe67BG9PlnxPfcNP6FKf3sDq8c3UkBXd/zVqXiQbk=;
        fh=UCSuWe+ZbAYnG0ft+XiZXth+lBGc/ZQHdC30YlgIoYA=;
        b=YLQukAvA3hQSADFqJaBZfRP3DDtG8QOl+yhI7aq932c8a0d0rCgesYydliECnYBPsP
         l6XMsRxklDrEefY83USKRkzLO11SS9kvgx6mCxuKRWPWcp3hlw2w/sTahzwziypGxq0t
         w5FNFBhVlljllUEdgUCw8Yxiq2MPrBSAZOcJ6Qr+g6ldLRkP/TxjIqLxkdv5ij3jpxiW
         TvGRVubWNyH2mW6rPA8elI4t/sZg6/aMerhVSxSt0DoGShShpQkJBNWj8X95jebGvW3E
         ct+KA65rN7uEBtQvCNEcy8dKLR2zXCj+25tQ1fGvXXPSmXesOr2QV/aaaE29KT1VEcLe
         DM9g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779481492; x=1780086292; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hFhe67BG9PlnxPfcNP6FKf3sDq8c3UkBXd/zVqXiQbk=;
        b=WE+BWjq6jMJrTLzHGk+epM3PuPOXf6rENb8dMV3dCU7KJNJmZKDsgBPRBQMt47JTZh
         HLuQSCSHqfjCyMEjlSsUppPdKBO8xXgWJPWjZB5nHemH3xztFgxwj/NZR6UPZVVvLElu
         43wxzv/TD+CNmRpEa7UtIiA461nsQz4lot+xkXO+JmLsZ4JBuNtrW2+fuQpy+6IqQhOq
         VN4bixfSVBtuDPhbArylXvrSxs43tWxXXcDit5UoUvZr/VCKbHsE4PpZp5AATPzPum3F
         UVXNFr9X4vcsMefERMnEH6dvmjMziiCiIDGJBZS9cJP8ZHdcPtTbCPyzeaqcT3LdcjIg
         j8rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779481492; x=1780086292;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hFhe67BG9PlnxPfcNP6FKf3sDq8c3UkBXd/zVqXiQbk=;
        b=SPrdspZdOZlzucuztaEvvA2dy1yoRVSIKMTYV/4B6s0GYEReIf6asLGdU46pR1if1b
         usFWqR0kwM9S89LprvCsoZyi+dGSE+CDK3glAwUGrQOTRBcWrJ3x46Vx6MMNK5PTbvPg
         kbqzU/vpv16xwZgWEGqKiSW+979SkpB82NCeJMc+63NXzwE8WbuU6/Ppy0EJ9fwxzyYm
         u1eAzigCkSq/PHGnUFaTOzqj3HCoQHurAvb7jKVbec2/fMjKI+63HGlaMViIfvblfDFF
         aiPitMCB4PSZS0RBKgGDlRSBoLnbyCdA1H2sBYkanmsJSPI6G9/mGGZE7CnkP/X/zpR/
         pjZA==
X-Gm-Message-State: AOJu0YwlZNfrrqdMDz50OnCsg9fud8ltU6yoQmKgK73v+rnynA6E+de8
	ghdsnWfHoYfYuV2Vt6NUmjeOim68V4XkhNGqAwUSjt3KI7comi+TqVGNL5m7Nr+FLZKhElR1aAT
	hOvSqAjEPIi8rIlfDH8TklVBNrEoJTfS8hS2r
X-Gm-Gg: Acq92OFqXrFhoa7OLNBsPP2nzJmSMaeE7NhKgOLiS497f9RRstPHTr1N3JPto0aRf5X
	jRNiw8zhiSvcyPNI9OeXTHf4rc07Q/26X9HNlvOMrp+hL9Chz9WULe7/QY70q54Vom63xP84YbT
	YOp9JCkIbav8UL5HoeDX97Bkzc7nVVd+beISgadhFJCci/GY1ztI9NXSS7SSya6zFc2F6FBY17+
	h4uQiRh3ZpShxxbzDpWSL1H3wyKGN9ZDqUr53O+JlkXkEM8fcKB6Cb27hb0U57Th1sBnH4sLcAA
	583M9220v8mzLgf6dtmvqY0NATr81HX04jA4hKX+
X-Received: by 2002:a05:690c:6b04:b0:7d1:b3a3:3fa9 with SMTP id
 00721157ae682-7d335fc9945mr58548047b3.19.1779481492343; Fri, 22 May 2026
 13:24:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260522200419.105496-1-vfazio@gmail.com>
In-Reply-To: <20260522200419.105496-1-vfazio@gmail.com>
From: Vincent Fazio <vfazio@gmail.com>
Date: Fri, 22 May 2026 15:24:41 -0500
X-Gm-Features: AVHnY4JsxfBE1tAbExTsBXf0fQiPNFZ122CZzPH2zefeWSVInVDspq3Jinz3f94
Message-ID: <CAOrEah6tu36JijhuZazNJBYc5XgXT-XjRfGKO0Ld-3gz6TDohQ@mail.gmail.com>
Subject: Re: [libgpiod][PATCH 0/3] bindings: python: add support for
 free-threaded Python
To: linux-gpio@vger.kernel.org
Cc: brgl@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-37384-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	TO_DN_NONE(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vfazio@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 830FC5BA06B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, May 22, 2026 at 3:04=E2=80=AFPM Vincent Fazio <vfazio@gmail.com> wr=
ote:
>
> This short series adds support for free-threaded Python and adds a new
> test suite to provide some confidence in the suitability of the bindings
> being used within a multi-threaded context.
>
> A changelog is also added to keep track of changes between releases.
>
> Note:
> The new threaded test suite was run on multiple machines in excess of
> 1M+ iterations in an attempt to make sure they were bug free but due
> to the nature of the problem, they may not be absolutely error free.
>

I forgot to link test logs, but the latest pipeline [0] shows all passes an=
d
includes an extra commit (not submitted) to run the free-threaded test
for 100k iterations for warm and fuzzies.

[0]: https://github.com/vfazio/libgpiod/actions/runs/26309499084

-Vincent

