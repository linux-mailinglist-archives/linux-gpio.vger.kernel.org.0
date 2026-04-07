Return-Path: <linux-gpio+bounces-34770-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EFcyIPXa1GlxyAcAu9opvQ
	(envelope-from <linux-gpio+bounces-34770-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Apr 2026 12:22:45 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D78CB3ACBC3
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Apr 2026 12:22:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BCAC83022549
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Apr 2026 10:21:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF1283A7F6D;
	Tue,  7 Apr 2026 10:21:55 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FF0930EF7B
	for <linux-gpio@vger.kernel.org>; Tue,  7 Apr 2026 10:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775557315; cv=none; b=h8QEtF8x1z6o9N6cM3bW3iKVHLJkaPZosbpAjPFeifzwC6tW38qrzNvk6nNrdZU+z6RKqZY+ZGFuUuDfzn6uHeaNTqq0QzHAAZ1uIomZWKCIIADN/OiIGJRl1gQ0QJcKMSdA8E5PTvyw0QLP6koYRFfhi576mNYlj7Fbd9GaAuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775557315; c=relaxed/simple;
	bh=tktu9XsoG2RfvvZNNs1LDTN6klQpEatUvU8LT9mGrbo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mCLjUrwTGpchWa51mKmhsdg8wxc1E+YYcoQxXC2nuqjxYiFnZcdbvPCPoYjGorh9bZ/CimlhtgdbbsIAw87qCKaBfs+e+LvwWm+TNy3Nl83RzKWaqiq0DPTR+9YqR7OjC2/M2owvHbkrZODFiyAsNmFTQC4FYKqTUqDk1lf8+GY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-953a2634777so1340519241.3
        for <linux-gpio@vger.kernel.org>; Tue, 07 Apr 2026 03:21:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775557313; x=1776162113;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gMnqiwkd26gjhp+7IbyHb9ESCX/5jdc78bBmqANU+lE=;
        b=ppQ/mCp6aBBJ343AlOgBbn/mg5y7pVDoyrpzGCwoXuZEfxEc/2XZ+c7gGkoraSX7Fc
         UR5fPAXoBRTM9BYGQjRMG2fH9Y09N0pkCg1PBMbatz2v4o+xyBVdCw06B8m3CzqtmUHT
         UDpGPcGlmoTakh3bBZH/R3ea6pdtP/UxUeWrCqgLSdQ7Ie33ECLrWxeoCBpany3u5XQc
         mXUGHt1sTyD0VOIClX/E6/zLgHyr4D3T7SKp7N9sfR5GR7oisUtK96DMmBpeQ9CWZWug
         jcTZj/9SwYLfhE3hDw/SoTFgw//CI1t98dmUBBo9GbhF3q3/xjZFQ3A267Su8yGiba07
         bm3Q==
X-Forwarded-Encrypted: i=1; AJvYcCWZdvq5Gg7H1FRhPKJAm16fauaHZz1vLLpRzVcoxRD0pP7jGeeWSrsYa1GjhuGDAfqbfGZ5xUluaX2r@vger.kernel.org
X-Gm-Message-State: AOJu0YyqcIemUp+o0zLvcpeY+EMDETLiaK51I/xlPQlMihmHroiVHNsZ
	l5tOiVz3H3eiEGAp1C4kUJnwo1GV5fp2Rbn+TVn8hwmt3/xqJqADbqr6AYWlmBN5
X-Gm-Gg: AeBDietE0O3L3l8xRSh6sNib03YWcldRBv4Wzre29ICQ99dT1wm8auH4iU1vBW7EUiU
	VjUX1qid3qhFX7jcbVSknU1cUkY/ATMFT7rf+7C0EVxZEVl7cWdcpjkuvqNPyFgqiH9eLsRuxlm
	QaT3/RcgHmkCUSFDDl+PQxlABgCTPCjLYNohqyhvUOaxDAPnNBYXTNTCMsIw2iXiqnPoG3a2+I1
	DAu7l7bY5+GXbXB4nJ/8BF3xizho5bTkhLmZkzazme4/78GGabvlPkhCgPZ6Fg3ssQgRiL0K+tj
	htfLjq+iLlWK9vUPKWZgx04Edk3/An/8zmP20v3RSArgG2s6jz71Udm9lxihzkfM6N5TufW4SPs
	60oKxNcBWTPDDAQKi2v4bgNSsi5Um+9O1KcLcezsKh9KAtm24wNWzMYEYlHp083t2r18DouUk2G
	qFRjVpCQ0ugh5H8PzW7n0UazP1WqpLJQ5v0zzf1sdZ2BESgxFq8hI9oKOwMcVg
X-Received: by 2002:a05:6102:42:b0:607:9443:b2ee with SMTP id ada2fe7eead31-6079443c3d8mr17039137.15.1775557312906;
        Tue, 07 Apr 2026 03:21:52 -0700 (PDT)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com. [209.85.222.51])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-60583093d14sm18631132137.11.2026.04.07.03.21.52
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2026 03:21:52 -0700 (PDT)
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-953a2634777so1340516241.3
        for <linux-gpio@vger.kernel.org>; Tue, 07 Apr 2026 03:21:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXk7i5FllZ/pTHnO8Pf3W4KKd0jK1dRBEVYalyaN4dhabcZYYCYT7elHNeYFxUm+c+XB65q9UfmVpOW@vger.kernel.org
X-Received: by 2002:a05:6102:f13:b0:604:e063:4fa8 with SMTP id
 ada2fe7eead31-605a510033bmr4709992137.26.1775557312414; Tue, 07 Apr 2026
 03:21:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1774283146.git.dan.carpenter@linaro.org> <edd789f8fc87f294211adf84b09c2af9f4aa6a6f.1774283146.git.dan.carpenter@linaro.org>
In-Reply-To: <edd789f8fc87f294211adf84b09c2af9f4aa6a6f.1774283146.git.dan.carpenter@linaro.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 7 Apr 2026 12:21:41 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWRgkAE-eSzRif6DSqRgOySiN48vcogESN1s2gs2k7bJQ@mail.gmail.com>
X-Gm-Features: AQROBzAIjWX-ymyQ91Ydg4QhzkmLosdw5bqMGDf5_aVfbRMiqgAMy27BrJESM2U
Message-ID: <CAMuHMdWRgkAE-eSzRif6DSqRgOySiN48vcogESN1s2gs2k7bJQ@mail.gmail.com>
Subject: Re: [PATCH v6 7/7] gpio: gpio-by-pinctrl: add pinctrl based generic
 GPIO driver
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Linus Walleij <linusw@kernel.org>, AKASHI Takahiro <akashi.tkhro@gmail.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Andy Shevchenko <andriy.shevchenko@intel.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, arm-scmi@vger.kernel.org, 
	Vincent Guittot <vincent.guittot@linaro.org>, Khaled Ali Ahmed <Khaled.AliAhmed@arm.com>, 
	Michal Simek <michal.simek@amd.com>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org,intel.com,oss.qualcomm.com,linaro.org,arm.com,amd.com];
	TAGGED_FROM(0.00)[bounces-34770-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.076];
	TAGGED_RCPT(0.00)[linux-gpio];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,mail.gmail.com:mid,linaro.org:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linux-m68k.org:email]
X-Rspamd-Queue-Id: D78CB3ACBC3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Dan,

On Mon, 23 Mar 2026 at 20:04, Dan Carpenter <dan.carpenter@linaro.org> wrote:
> From: AKASHI Takahiro <takahiro.akashi@linaro.org>
>
> The ARM SCMI pinctrl protocol allows GPIO access.  Instead of creating
> a new SCMI GPIO driver, this driver is a generic GPIO driver that uses
> standard pinctrl interfaces.
>
> Signed-off-by: AKASHI Takahiro <takahiro.akashi@linaro.org>
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> Reviewed-by: Linus Walleij <linusw@kernel.org>
> Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Thanks for your patch, which is now commit 7671f4949a6c9111
("gpio: gpio-by-pinctrl: add pinctrl based generic GPIO driver")
in gpio/for-next.

> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -246,6 +246,19 @@ config GPIO_BRCMSTB
>         help
>           Say yes here to enable GPIO support for Broadcom STB (BCM7XXX) SoCs.
>
> +config GPIO_BY_PINCTRL
> +       tristate "GPIO support based on a pure pin control backend"
> +       depends on GPIOLIB

Should this depend on ARM_SCMI *|| COMPILE_TEST)?  The driver only
matches against the "scmi-pinctrl-gpio" compatible value.
Or do you envision a use case without SCMI?

> +       help
> +         Support for generic GPIO handling based on top of pin control.
> +         Traditionally, firmware creates a GPIO interface or a pin
> +         controller interface and we have a driver to support it.  But
> +         in SCMI, the pin control interface is generic and we can
> +         create a simple GPIO device based on the pin control interface
> +         without doing anything custom.
> +
> +         This driver used to do GPIO over the ARM SCMI protocol.
                        ^
I have sent a patch to add the missing "is".
https://lore.kernel.org/b1ecb31a37f8e35447122554a38985cb6240eb11.1775556619.git.geert+renesas@glider.be

> +
>  config GPIO_CADENCE
>         tristate "Cadence GPIO support"
>         depends on OF_GPIO

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

