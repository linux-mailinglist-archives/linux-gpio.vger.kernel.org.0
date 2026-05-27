Return-Path: <linux-gpio+bounces-37551-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MAK1J5WXFmrVngcAu9opvQ
	(envelope-from <linux-gpio+bounces-37551-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 27 May 2026 09:04:53 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EA5B65E02EB
	for <lists+linux-gpio@lfdr.de>; Wed, 27 May 2026 09:04:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8D29F301C3E7
	for <lists+linux-gpio@lfdr.de>; Wed, 27 May 2026 07:04:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C5B73B7B98;
	Wed, 27 May 2026 07:04:51 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4B053B6347
	for <linux-gpio@vger.kernel.org>; Wed, 27 May 2026 07:04:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779865491; cv=none; b=kDNjodD/+HZcQ1FXCNj4vmSYrOEKhlWO/GgZDy0uNBMEI7g+Joiq6trMg7QwrXuPxR5NUKjdnsonxM4+E48P/s5zz+ZDT+O/yeMeVtuDjUSi0TkVdrT/gsXGT2jERae7xq0hxkrsBAFSyIVxdBmPRUoVyrlBzuKqFQMu/RkZWms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779865491; c=relaxed/simple;
	bh=GKMmnSobBzwl8JTLQd/YSJsYNvtWz84m/vNFGhXlBbE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pTkZKHNTQvcuhXAIgdPAgrwuT3glJ8Tmc5EoX7TSNd+PRLbiqBmgGTVUOGl9P62dS5wyzPATM/sVXllGLY65cGr/kcwSCLCvtkNlLmCKc2eUn3RmmE14LY6hawSVa4bwkFkkrzjh4nvwG2wnx6ay39Tg/qhUOM5TwU1H0HAHa7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-63124ac76f5so3621840137.1
        for <linux-gpio@vger.kernel.org>; Wed, 27 May 2026 00:04:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779865488; x=1780470288;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6b1O7SqPXRKk3Tzhi5LoKK3yhm2w/yWFcqIE+eebFbc=;
        b=dIYrp2/aKewmSU+VAOmD7CWL7Jc5j6Cx2zkpME68UDzbdiUSpIK8YO/VC7BtCU6Qka
         /u/YV6YKS58zLR06WEhxhmWTs3oMeJLX/5pHI8/ml/Iy84JCosa3N5+lsSdTpCERXDF+
         BMkXCHXFDEUlocGv3eoyEjP6s1kbztlzB99NuLwp64gI6e6thBHoXNiCrnvph49ekZ6l
         ru/roRhJdMCLz3HjXP+1lEnpsuct7BgLoFfDg1g1cbqIWG8PotbDLaWnSiivZ/A3Ihrh
         ldCuuUYABuZwPZDi1HgCEQHHguUQzwGGxGyrKug2XVR9OHRuV4n330dHh/iGTXPSiKKZ
         R2uA==
X-Forwarded-Encrypted: i=1; AFNElJ/qPWQj9O76SPyMbe+/uK6sL38PrI68fPMYhh6CjvezPw5gmxfrR9z+RcMFLVE5soVOIpfhxv8LyYwQ@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0JubJOVh/O+8QA7bZQjAd3WYrPgqx8V2Hxg9g5Cp8EJD60Y43
	4+DvhAW8HclUV6rsZAK7ivetIX237Iy3wsn6iGPQrf3Er8mVANkDAzJeiWz+MHX/3G4=
X-Gm-Gg: Acq92OEcOzHb604lk8o4lH/nf/bAEFCiPJAujmWcpRuLMN5C2RYhUixcFfh8stNc0Ik
	VbE5gQh8oD5pCmiUezW83i3+ZCmdYNyxrl0Qi8nc5Z2rnjAhhaylLwAXgQ8mZC6I0OMKtNdLNjQ
	IjlPLPw5JpXeRQlEukKk9kZU8pYs3/ilx23BiNZMTamXKyQscmyiRqjEuoOBmE4AtQtmR4yTgsW
	oK3zGn7C/t3u8nBzKpEE/MDNoG3Gw8WU1DuLgGb8WpHCoDpu8baY0GYqXrl6KM4My2YE1iUChSC
	STiEvv6NHPjOtG7Yg0hjEMZNBYYyN3ef5UnK8CzOsuCARfHN14l8+LQMbdxCMePFcKR97+V32kz
	aAyEDfAoGGgmjTwL4rFHvvBEBYf4mRagCQ/1C3hcaYBycX93ICV6zfKg1FRNWIfx4R5j+vo2qjp
	HLAf1DRtdYEgbDpKCtDZoIagTqs9pn+ImW3yV44XLz3B/euay+cXiqaAGhT4rStr6ZElQU2ac=
X-Received: by 2002:a05:6102:6a88:b0:6a2:b2a1:f16a with SMTP id ada2fe7eead31-6a2b2eee043mr2110891137.2.1779865488519;
        Wed, 27 May 2026 00:04:48 -0700 (PDT)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com. [209.85.222.41])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-67ff5f1140asm16350380137.12.2026.05.27.00.04.48
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 May 2026 00:04:48 -0700 (PDT)
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-95699e8e26aso3778078241.0
        for <linux-gpio@vger.kernel.org>; Wed, 27 May 2026 00:04:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9RrxtDQDPYOpKrwKRPDWs2qSZDjg/CEhNZv9Q7/mgXai2Igim2kNUqO1cUN1Vm5vNKlnNLmBvDFJJj@vger.kernel.org
X-Received: by 2002:a05:6102:3e8d:b0:62f:34db:9474 with SMTP id
 ada2fe7eead31-67c8c3f0c9amr10644205137.20.1779865487931; Wed, 27 May 2026
 00:04:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260522105717.1727837-1-claudiu.beznea@kernel.org>
In-Reply-To: <20260522105717.1727837-1-claudiu.beznea@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 27 May 2026 09:04:37 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVQCKmmNMYOs1nbE3nEoBk5uoQBVPy448pKAEq8aqLPDw@mail.gmail.com>
X-Gm-Features: AVHnY4JnV7OBtFs3jVCT30b4PRifJZS7GqIqdG2hkN5jrcNMinu4UQ3d7c-uTdo
Message-ID: <CAMuHMdVQCKmmNMYOs1nbE3nEoBk5uoQBVPy448pKAEq8aqLPDw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: renesas: rzv2m: Use -ENOTSUPP instead of -EOPNOTSUPP
To: Claudiu Beznea <claudiu.beznea@kernel.org>
Cc: linusw@kernel.org, brgl@kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37551-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MIME_TRACE(0.00)[0:+];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-gpio@vger.kernel.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-0.992];
	RCPT_COUNT_SEVEN(0.00)[7];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux-m68k.org:email,renesas.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,mail.gmail.com:mid]
X-Rspamd-Queue-Id: EA5B65E02EB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, 22 May 2026 at 12:57, Claudiu Beznea <claudiu.beznea@kernel.org> wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> The pinctrl and GPIO core code make exceptions for the -ENOTSUPP error
> code. One such example is gpio_set_config_with_argument_optional(), which
> returns success when gpio_set_config_with_argument() returns -ENOTSUPP, but
> reports failure for all other error codes.
>
> Returning -EOPNOTSUPP from the pinctrl driver on the unsupported pinctrl
> operation may lead to boot failures when pinctrl drivers implements
> struct gpio_chip::set_config, the system uses GPIO hogs, and the
> struct gpio_chip::set_config implementation returns -EOPNOTSUPP for the
> unsupported operations.
>
> Currently, the driver does not implement struct gpio_chip::set_config().
> To avoid future failures, return -ENOTSUPP from
> rzv2m_pinctrl_pinconf_set().
>
> rzv2m_pinctrl_pinconf_group_get() is used when dumping pinctrl
> configuration. pinconf_generic_dump_one(), which calls it, makes
> exceptions for the -EINVAL and -ENOTSUPP error codes. The documentation
> for struct pinconf_ops::pin_config_group_get states that it "should
> return -ENOTSUPP and -EINVAL using the same rules as pin_config_get()".
> The documentation for struct pinconf_ops::pin_config_get states:
>
> "get the config of a certain pin, if the requested config is not available
> on this controller this should return -ENOTSUPP and if it is available but
> disabled it should return -EINVAL".
>
> Return -ENOTSUPP for the unsupported pinctrl operation.
>
> Suggested-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

