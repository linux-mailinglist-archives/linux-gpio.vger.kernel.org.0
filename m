Return-Path: <linux-gpio+bounces-37338-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WIA3NugrEGphUgYAu9opvQ
	(envelope-from <linux-gpio+bounces-37338-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 22 May 2026 12:11:52 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 702665B1C27
	for <lists+linux-gpio@lfdr.de>; Fri, 22 May 2026 12:11:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EA93230BE779
	for <lists+linux-gpio@lfdr.de>; Fri, 22 May 2026 10:04:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABDB33C76A1;
	Fri, 22 May 2026 10:04:48 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D269C3C65FE
	for <linux-gpio@vger.kernel.org>; Fri, 22 May 2026 10:04:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779444288; cv=none; b=m/MaBxua+U1eLMOj4/S8AxthzacbiDvppkI8wy+0/1HMlGY1JE0rypHp9JoYeoJlsO55qSKmyPaGbeXv3WIrz9n/dDeWbm0s8XoHND4lpetu/pT2tMyNFwiHCd+97p5raUc8Ko2WfGwApmEA2+q2gR0qKhGkUY34/wo/fTX5w8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779444288; c=relaxed/simple;
	bh=cPyf6p/XKrJubb9Nym45gBjTYmcHCP1JNKlIqT8IZ/w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Fu7aULDDbzp3evBscs1RDyB/bELgOny7cST+Ck9vlgN1rlzHzATXUp6SRfFz5uaYAaPhzHWDl2fcRTqwzior3HzdqdASFTba7SXohJTtptql2p/A2iAoiCiT06xvOBiEaOPyZjmHg7yiERl2E6ythhmW9oIPRmTCs+zEXpI1vXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-57512b86273so5212360e0c.3
        for <linux-gpio@vger.kernel.org>; Fri, 22 May 2026 03:04:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779444284; x=1780049084;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FJUL14tFNOQCmDEBkpQTY/EgtnSRNRNf2m4/Z8oQVFQ=;
        b=aM+xK6LCsoNjLKmqqFbV/zF5Ldg3pzUwBSbWFAP41oyF9evLImB3yeSzyQp9cr+RN/
         J4+JxmxBcohHtoU4ucsJKPHoJnEqx46+oIzBImQ9xux7E0fXpNwmx5V7F+XKxl10Pshb
         lcpUyx8qLS1/RG3m6HRl1+q33da3T81vQe7Wtl8KsguaTbMt0iSverXKE025cs60A1Jw
         pJOBIQHOtmX/0PA9RkGyAESahT69R/PqOvF7ZYyCJPhPEApbL36ZFrk5iDRUzujwOPhX
         gA9hReSj3ZUt0HTgokhJsAQsZ+ry6IzCsf/pv+IdsysO2ALIbIp+77B4a225LG59pXCU
         UF6w==
X-Forwarded-Encrypted: i=1; AFNElJ83i+/iEoYRf5YAPmihPAT1FJSxuJ3pSgXtWOLUiD5sVjxvEMr4SrX+ClebzZfm5qB5NdjA2JAKU4yX@vger.kernel.org
X-Gm-Message-State: AOJu0YxbmmyX9NUFthcJzHl/08z4sOB7XvZZwzTfNVSZrdiL88aLLtb5
	8zmqwUAEtOLt08NVpy1LV2ZbBLuIbab8/3ZhyotskTvMfYCxoRrsHOBzbPzE+iyB
X-Gm-Gg: Acq92OFbgGSmaHe0ybDvuI8HRGaS1AyvhM4QRuwfuCYVSoa5KlTKFfVAZsKUyjrAyys
	6qirFSUkgaSmHSP7TPO5qnF/90eZqvKTNqxmj3LdWn2UWdvlNQv65/IOi8HsLR+l2WcWpG/OjyK
	Vob9ADpTcKSniZmyObBoYbzcbP+Xe/ANFPtHlIslUAxYpJwp3ft1J6FPbfaEVo/qd37XSjxHaOV
	6NbWOW171DfnaiKq/6hRN43i3nwkQV8akQ4Pbn1cSdoHRu/4wpmgV5Xd777VXdO4QpsXClSJuUd
	knrxlPfBwn8mRPivDI3auAnUEfdSmG+Ulp40VpSmzy4x7By9E+MUbtfiA5xIHyj7nXsK7L602YW
	UHdwfI11Yyd1Zyt6QKsBfhV7yAMKE7PEOUFfpxa+BROJslSE5VLDyLkMB8L0aWqm0lvRpr8Wos+
	J6c0RaN54xb7QMEnGe7DvwgcA1WECDYqYKaDh4JtGgiJ7yLJe89WVVs4HhWMWLCBCP
X-Received: by 2002:a05:6122:2093:b0:56c:ca03:b668 with SMTP id 71dfb90a1353d-5865ea8bf4emr1353308e0c.3.1779444284599;
        Fri, 22 May 2026 03:04:44 -0700 (PDT)
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com. [209.85.221.180])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-586f25d708bsm1590800e0c.1.2026.05.22.03.04.44
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 03:04:44 -0700 (PDT)
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-575267e3398so5868930e0c.1
        for <linux-gpio@vger.kernel.org>; Fri, 22 May 2026 03:04:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8kFY8Mewlpm0cXIrTrIRLjz2I9V8IEVDIeuBQXA3zdlDpQNWgU6vJMgeB9+/q7e4uT0j3kSOQO1Wt2@vger.kernel.org
X-Received: by 2002:a05:6122:e22c:b0:56f:bb91:4861 with SMTP id
 71dfb90a1353d-586595dd60bmr1509233e0c.0.1779444283961; Fri, 22 May 2026
 03:04:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260513115312.1574367-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260513115312.1574367-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260513115312.1574367-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 22 May 2026 12:04:32 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVcgJ=aG2p-9gx+gtUwM0xcFo+D0NEqBJnqOqSmBEM7ZA@mail.gmail.com>
X-Gm-Features: AVHnY4J9gG82jZ29COhQDeru9nClVZkKnYVdR2yBsg7-d7Z_mL0WABVx35RpFZY
Message-ID: <CAMuHMdVcgJ=aG2p-9gx+gtUwM0xcFo+D0NEqBJnqOqSmBEM7ZA@mail.gmail.com>
Subject: Re: [PATCH 2/2] pinctrl: renesas: rzt2h: Skip PFC mode configuration
 if already set
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Linus Walleij <linusw@kernel.org>, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	TAGGED_FROM(0.00)[bounces-37338-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[6];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.643];
	RCPT_COUNT_SEVEN(0.00)[8];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 702665B1C27
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Prabhakar,

On Wed, 13 May 2026 at 13:53, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> In rzt2h_pinctrl_set_pfc_mode(), read the PMC and PFC registers upfront
> and skip the pin function configuration if the pin is already in
> peripheral mode with the desired function.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/pinctrl/renesas/pinctrl-rzt2h.c
> +++ b/drivers/pinctrl/renesas/pinctrl-rzt2h.c
> @@ -188,8 +188,18 @@ static void rzt2h_pinctrl_set_pfc_mode(struct rzt2h_pinctrl *pctrl,
>  {
>         u64 reg64;
>         u16 reg16;
> +       u8 pmc;
>
>         guard(raw_spinlock_irqsave)(&pctrl->lock);

Missing blank line.

> +       reg64 = rzt2h_pinctrl_readq(pctrl, port, PFC(port));
> +       pmc = (pctrl, port, PMC(port));
> +       /* Check if pin is already configured to the desired function */
> +       if (pmc & BIT(pin)) {
> +               u8 current_func = field_get(PFC_PIN_MASK(pin), reg64);
> +
> +               if (current_func == func)
> +                       return;
> +       }

I will shrink that to

    if ((rzt2h_pinctrl_readb(pctrl, port, PMC(port)) & BIT(pin)) &&
        field_get(PFC_PIN_MASK(pin), reg64) == func)
            return;

while applying.

>
>         /* Set pin to 'Non-use (Hi-Z input protection)'  */
>         reg16 = rzt2h_pinctrl_readw(pctrl, port, PM(port));

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-pinctrl for v7.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

