Return-Path: <linux-gpio+bounces-36090-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mLQJCTr/+Gko4AIAu9opvQ
	(envelope-from <linux-gpio+bounces-36090-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 04 May 2026 22:19:06 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 14D1A4C37B6
	for <lists+linux-gpio@lfdr.de>; Mon, 04 May 2026 22:19:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 040E2300AD5E
	for <lists+linux-gpio@lfdr.de>; Mon,  4 May 2026 20:19:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CC4330EF97;
	Mon,  4 May 2026 20:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mvCgVCzH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E74D730CD85
	for <linux-gpio@vger.kernel.org>; Mon,  4 May 2026 20:18:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777925938; cv=none; b=eieK4pPvEz6YQ1zQ4Nd6mcUHR1naCYAINnWV40af5pe2arS37IPaHJDpo4Cqa0oyMTtPI9UcHzORx3ae5ZRHHRuUlY+ICke1M6/9/5gjGLci3rn98tvyUORjcHV8EG4Vz4NG0SCCnwdOY7WDjyKD4mHCpt87d7bFTM5vvjUC8dY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777925938; c=relaxed/simple;
	bh=N6UegUMPVqsytVGjvQd324pOoBxsFd5qa7Zd8BjH3BM=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=W9s2K2cIAuWMK9AJ2DWjbNBw8ouvCbTyxOKJ7cvtUDP084GOlnm8MkqrJq+wDjlgtIOhyhl8kb57Has9Kl/FSwJLTlAIkNX/O5Ykid0Dk2J1AW2aklMDPKcKbhgPGpOwOvy4v9lXmhQfNEtnlP+m8Mcnxv3UHYiESD5cep3FuVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mvCgVCzH; arc=none smtp.client-ip=74.125.224.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-651bc8f864fso3082136d50.1
        for <linux-gpio@vger.kernel.org>; Mon, 04 May 2026 13:18:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777925936; x=1778530736; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=edeSNJIfcvxAKAgY+J6XlMlLvjtXfT7TjmVwtTZmeJM=;
        b=mvCgVCzHjlbgrTX9kYsA7dgxyuP3A/CZ1yVOc0veJwVcLeyCwBMW4NHg+uTC9l0tmr
         Bvo//Jt0jYm1DP7WyHEn/YLedbieQ6s5jAB9Ral4C9qIHFqyDVcRWTdMbVtQ85Qi5pEg
         HdC3S8LKsZbRztfYcU2A22nTmL6Gp4oVRjNdb+8m/1yCP3hGJXBRNQd2rtOCVPh3S6ti
         ai1HFkxTkh7pIXAtR6/1Z0By03rBeo3ocCnrtunChlLKaUg4KOqzAtCQvrA6gCItajF/
         MkKTvZJQ6S+prpw3Zhg2eE4Ue4a+rMUBoik9VycDae+b0WbkOHJQkmxudaOBlkJE6X7N
         7fvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777925936; x=1778530736;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=edeSNJIfcvxAKAgY+J6XlMlLvjtXfT7TjmVwtTZmeJM=;
        b=SarrSzUFFVcBXma+uf05trPIy1amk21nlruxZVWhwm7f/Md54vYk3HWIJqPecFUuX3
         UnPm4Xbrd0hamvZvEx+Vaxcl+CSoDecqDMH2UpOlYeeVCFYDwlpfbQ0kPKuUgB4MnS43
         LBkHOptjSqRF6bPMJD11+1rr3p/IGf52dJaAaRxGYHlPaPHE8vk364JdQkR0R1knVykW
         ppkOgMRHqmEXE3OO+YN12YNA8XMNIErjYOsdhOXwcRTtGoDBwzvPGbrVgzwA3is1+EEk
         4gyvhyTEo1W/tFw55otgnYFfE59rBNlx6tilNT2rDqd/1jp8kuZ8k5wOE+44NleyAGM5
         /g0Q==
X-Gm-Message-State: AOJu0YyDx5fcu/xP879+q8ZPLjaUZHsj1TF51FrwCWfGGHYJg1t58drB
	fH4sPXOnU2ci4CMYQ7tlNYL2LqIbIusBUXjclxfiINBNa0RWN6GULOTk6/hq3BJA
X-Gm-Gg: AeBDietaYAL8y4jAeZTE6RETdCsy4Tk4j4jrZwAGl10sMRQxJMw8Ngy7EJ51AjbDQt7
	cx+YyKTHA8+Zd9zf3eYQ+M+Kc6awhEYcVu1R4PgWQ3BVIoVVBbCBC28i84JEQxwTzuDBybAiLYW
	8SUgs1qgNrxBbLyqDmwbwnoLPB1w+16LGCAkIP81Cwze3k3HGgcV5sQv4EbIOUC26P+1Q5DBcA8
	mLsrsdOs4mqhWe4AU/BKzilV4pJmyOzXiaGTfgCvB0EiNWSBRN5z2zIHX2o+kukj70/0LsjIERH
	4QTM6s3a8H4ET1wldcMTPgpMumTwIhZjsGG9f3p4zh/F/F8w+NUvtL17rFvDUR6/ER1XfOhBdUj
	AntIbjhb+m+HpN1P7AxIjxmdm8BeXYUNyFYAMXFDgTPrdQsXJruspfabQrK+Is2y5EnFdI2RtxT
	9TvmBLguxJQptEe/gVnzIrjOqQvGa2p15d56tNT1gPnPu2QWPmm+v2iaW4hcg=
X-Received: by 2002:a05:690c:7:b0:7b7:29e4:7dd2 with SMTP id 00721157ae682-7bd7710677bmr114392337b3.40.1777925935903;
        Mon, 04 May 2026 13:18:55 -0700 (PDT)
Received: from localhost ([208.185.137.148])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7bd6685d0cbsm53421427b3.35.2026.05.04.13.18.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 May 2026 13:18:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 04 May 2026 15:18:54 -0500
Message-Id: <DIA656PT46GW.2Q15WVT679RS6@gmail.com>
From: "Maxwell Doose" <m32285159@gmail.com>
To: "Lucas Poupeau" <lucasp.linux@gmail.com>, <linus.walleij@linaro.org>,
 <brgl@bgdev.pl>
Cc: <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] tools: gpio: replace strncpy with strscpy
X-Mailer: aerc 0.21.0
References: <20260504195251.53771-1-lucasp.linux@gmail.com>
In-Reply-To: <20260504195251.53771-1-lucasp.linux@gmail.com>
X-Rspamd-Queue-Id: 14D1A4C37B6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36090-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,linaro.org,bgdev.pl];
	FREEMAIL_FROM(0.00)[gmail.com];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[m32285159@gmail.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,checkpatch.pl:url]

Hi Lucas,

On Mon, May 4, 2026 at 2:53=E2=80=AFPM Lucas Poupeau <lucasp.linux@gmail.co=
m> wrote:
>
> Replace strncpy with strscpy in gpio-utils.c. strscpy is the preferred
> way to copy strings in the kernel as it guarantees NUL-termination and
> is more robust.
>
> Reported by checkpatch.pl.
>
> Signed-off-by: Lucas Poupeau <lucasp.linux@gmail.com>
> ---
> =C2=A0tools/gpio/gpio-utils.c | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>
[snip]

There's already someone working on this:

https://lore.kernel.org/linux-gpio/20260504134532.0438e390@pumpkin/

but to be honest this one is much better than that one. Just some quick
recommendations, please change:

>+       strscpy(req.consumer, consumer);

to be something like:

	strscpy(req.consumer, consumer, sizeof(req.consumer));

Also, please double check the commit message and subject (says strncpy,
should be strcpy). Once you fix those issues feel free to add my
reviewed-by (Reviewed-by: Maxwell Doose <m32285159@gmail.com>).

best regards,
max

