Return-Path: <linux-gpio+bounces-39962-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 0AMYNNatVGpZpQMAu9opvQ
	(envelope-from <linux-gpio+bounces-39962-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Jul 2026 11:20:22 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 651A67493BE
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Jul 2026 11:20:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39962-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39962-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id CDE8F300E29F
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Jul 2026 09:20:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6B063E0C50;
	Mon, 13 Jul 2026 09:20:20 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FB2A3E00A9
	for <linux-gpio@vger.kernel.org>; Mon, 13 Jul 2026 09:20:16 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783934419; cv=none; b=jCam81Ye6xbvm2dCvI53fr7qvewGEbnNgcsbZAf8BoO0fkkWPyUPq76Jafrqx/Kl984BydgkVBSIfoZYwPfIUW88mfw4NH6DuFgYHDr0DenOr2RBEJXOcwGW8ezmuUVoiV4mUNNsW1L87CrVGBO5cArCvBM0/DNHrZ0maZXSof4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783934419; c=relaxed/simple;
	bh=zgIM9UCa3XkWmd6kqFFWou+UXKAbWYBBdjA28fRvpGw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VTwCoBQuHgQKG1sN5qg7bISW3VJIq8nOik3XkHHKpl0PaPEOgMyoHemhoM8ymDEbWCHEBPWHtrbTacQWPDc14fo/qlBnjEq7+kFNd6RisRDAw5OIDNVDwgfppBpJFJ2Ga7NuDC2G6q9P12Z/riSUBFDhF9CuQ1dTsCbA2aGlH0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.48
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-7391d5504b5so1883840137.3
        for <linux-gpio@vger.kernel.org>; Mon, 13 Jul 2026 02:20:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783934415; x=1784539215;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=FudjopChxRShNl2EKXmfpQ4D5dQDLukS5DHJwD71hIo=;
        b=nvw0YD6WKT3OMiqg+kO6Ld5xks7vsM0Hc10EzmlHVM9X/E6fYH+nzQqKXlyID8X6Ud
         gwwwxCWXyQ4g756JMugjl0nAUDUTzB2/wXKvV967RdVi0ebYBFlPSukdR8Wb1iRdE5//
         Z4hIf2hocx7D6CxC49fp7kOsFGCIfY5VWnLa+1nk1x+Rl0VJmRwE45QaBB1PcvRtHYld
         z/Wdtqd7yq7hW2AsaUaehYSDcDi64c/ICTy1xpDdPO28SHXbEyYHRfoeUSMhDSzennqV
         UhtRpzkdMcj5wTJzbUf9QV/6ySfTiK2dHm/4irgaqQZo4rFhtE5iZsETAvO5EmwxHwaw
         W8/A==
X-Forwarded-Encrypted: i=1; AHgh+RoAMBXX6IPivSrQD9s2Vsa+l+vm5Moc+qP9YBmmyv7CzlvWGgrJjJjkir5JnH4jCKS6iGCXtMu+EY4t@vger.kernel.org
X-Gm-Message-State: AOJu0YzXqauptHHagaNGSgvx3j7BkXEF2C4bKXTnHtNog+SJERQbWco9
	3nJAFd5r0JMGSjkD98HG4m8DZpNfo5788JeEOEDAhdkt3u1i4NZcS9Hd0HoZ3O1l
X-Gm-Gg: AfdE7clbWBRrmoxFS/f+ovc6bPF73XRvzH+JYPl6N45JzbhdcQy/nS15kRuZqr/8p9u
	4pvbIIfeXrV8JMdDvbZj3lEmc1wQkvadjqSvgq1BsJumQgQ5sDzPdcOB5/cjf0it7j58UZYDUFx
	xjJqyCaTKBrUUr0tkmZSbYk79CfRXZzD/vkK6m1G2pA0X0CIeaWPmLWdbXnoJpruk1o8tAcFx+p
	MTCnVcpgPamOafVP5ppKKJ9/Fdh1LrLd6E2JXlGaplKXRiLebp3CxKmalWybySp/Qi2bnYkTezo
	zEWhSEAfDG+ocIiwaAz0YLl95CyAL64ZVIqEO9FxcOqm0rPbjarXfGavoJPAV0ACvZSDHIXA1hx
	Wxa8iBnhEScxXk3MIfL6hqgXjAwEc7HyQki3Ps7zrfHRwCZnqsV8yO2jphPtaYlXWF2YSR5ulwG
	iWcE2QGATkHYgHcxgydz1Ry4ocbrtqMRQ25LFIY+kLcS8CkBWoEQ==
X-Received: by 2002:a05:6102:8017:b0:738:c9e1:c58 with SMTP id ada2fe7eead31-74533e9fcc5mr5592664137.28.1783934414851;
        Mon, 13 Jul 2026 02:20:14 -0700 (PDT)
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com. [209.85.217.53])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-744d6e38e25sm8570960137.11.2026.07.13.02.20.14
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 02:20:14 -0700 (PDT)
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-7391d5504b5so1883829137.3
        for <linux-gpio@vger.kernel.org>; Mon, 13 Jul 2026 02:20:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rqv1q3SzE+StGpziBZ3jpRa79xXCjOKlabPqhOz93mRSK9o85tenaBnJVNoEAp7XHtkz0DHnp+gR6rV@vger.kernel.org
X-Received: by 2002:a05:6102:5a88:b0:737:8ff4:147f with SMTP id
 ada2fe7eead31-74533d96437mr5149659137.17.1783934414002; Mon, 13 Jul 2026
 02:20:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260712093148.21446-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20260712093148.21446-2-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 13 Jul 2026 11:20:02 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV415V23a9E2QM77iQdGePOoZYNk=+v0Hms6uxugKBu5g@mail.gmail.com>
X-Gm-Features: AUfX_mzy589jps_1O1AtmCocHbl-UiTW35zpb0NKjYk3J02kC89IR38oMnQCTrQ
Message-ID: <CAMuHMdV415V23a9E2QM77iQdGePOoZYNk=+v0Hms6uxugKBu5g@mail.gmail.com>
Subject: Re: [PATCH] gpio: sloppy-logic-analyzer: add a comment explaining the
 buffer init
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Abdun Nihaal <nihaal@cse.iitm.ac.in>, 
	Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-39962-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:wsa+renesas@sang-engineering.com,m:linux-renesas-soc@vger.kernel.org,m:nihaal@cse.iitm.ac.in,m:linusw@kernel.org,m:brgl@kernel.org,m:linux-gpio@vger.kernel.org,m:wsa@sang-engineering.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[geert@linux-m68k.org,linux-gpio@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	R_DKIM_NA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,linux-m68k.org:from_mime,linux-m68k.org:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp,sang-engineering.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 651A67493BE

Hi Wolfram,

Thanks for your patch!

On Sun, 12 Jul 2026 at 11:32, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> To avoid more false positive reports of "leaking memory" when
> fops_buf_size_set() returns an error.

But who is freeing priv->blob.data when fops_buf_size_set() succeeds?

>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

> --- a/drivers/gpio/gpio-sloppy-logic-analyzer.c
> +++ b/drivers/gpio/gpio-sloppy-logic-analyzer.c
> @@ -237,6 +237,7 @@ static int gpio_la_poll_probe(struct platform_device *pdev)
>         if (ret)
>                 return ret;
>
> +       /* Initially allocate a buffer. It currently is NULL */
>         fops_buf_size_set(priv, GPIO_LA_DEFAULT_BUF_SIZE);
>
>         priv->descs = devm_gpiod_get_array(dev, "probe", GPIOD_IN);

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

