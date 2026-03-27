Return-Path: <linux-gpio+bounces-34242-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MBTRDThZxmkrJAUAu9opvQ
	(envelope-from <linux-gpio+bounces-34242-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Mar 2026 11:17:28 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id C1BAF342588
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Mar 2026 11:17:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B384C3051379
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Mar 2026 10:17:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D78A3B389A;
	Fri, 27 Mar 2026 10:17:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qn6UBzLC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A03653AE183
	for <linux-gpio@vger.kernel.org>; Fri, 27 Mar 2026 10:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774606629; cv=pass; b=g07NHJKMmIaPxWxYgt3XP0jY0JxhRoXXBSXHEDeOZQcu7ygOKrVTuvGnvodRJsjeeSvKblNa29y81ZtKullHPR+G+IWJHWZgN8Xt/EZj4mqiD/T1Trl1rOyALol2ig9bvbGfhl1erHujpupmyInAOPwlgwFhgUiisbI87kURt8A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774606629; c=relaxed/simple;
	bh=qS2Q9O7bG/xoCokg+S7YRoYhx+f6F9kSCLDT8bvQ+58=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e2BrgfCLUgbCak1yCaflr4uSq2EmJoi7dIk0xiu3O5kBk3Yyl/FwofCggXtELOMUWVOIV9TmH0DxeFJn+MbNH1F3VEc9GIzOwF8B54bo6tRfbipBhfcKV2JzNGGRu+5QpismqmJIG+H/l/WoPifezc5QSggyIo9Iwl1BiJ9gNSs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qn6UBzLC; arc=pass smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-486fd5360d4so24223985e9.1
        for <linux-gpio@vger.kernel.org>; Fri, 27 Mar 2026 03:17:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774606625; cv=none;
        d=google.com; s=arc-20240605;
        b=PiwDyaRrSdPm20nClyl+JAhqJF5uaIfSnrDtvP253XtegWwo4L1tMt0KyCbw+JcA+o
         wB1GWZ15XUy1heK2z0oiSbatXMjiCxjPDBJSl2Ta9k6GAaLtm652vePe3xFSgwHEM7GP
         sPipJ3wuOHZjw3Lk2fOW+11NQXvJ/YtbuIENOxylBTTlMj8IE9eujbwgGRjA7BoOx1Mv
         QrvBO0AHo/thimAXJEDxLjtiWXIhfSu0pYKSPidKRqJiTLi+QpZUcDNudO0MaiOHCusv
         AdsrLIpQtwXKqdpJBy77oyhYgDjdtoRmo826Cbk+M6Mmk34vYuu/fjjvU5dV3IVMZPCc
         vmSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MD962DJa2d+eTZumSAmw+2SavlPnEgh1c+O5EkQB1zw=;
        fh=tpu6FRqh6ANxhtN0TeYMF6qvMjBusvhZR0U+HckYQS4=;
        b=MYbuRL5xNEerDw4+bDBscfw3Ajh2Ume3mnuachsy0a2yyTUDzAc2J59jItFbBjrCoz
         wcj62oJY1jM7cKrFJ855DunP4Xer6Hrs99N7eV6DHtlhxmzQqN8VfzfNQkIRhH9krVSI
         2yqrBQECogeXKMHdLlcc860EElgCv/8BX/KLq7eoE39jVUMOohu+7a1hvkmWCkALKScr
         DNotAY9KGOrh6DRSkG0+fYuS+58UsisUJpvNUz8K0ylhudjDnWS3yTFxrX81pEHArn6L
         hZcz/VZkNX819w5CO5qKR7qMewnt8rJ4dEGCGHdeW+ByagxOe2MrU+dZDLVB4VXO7It9
         jorw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774606625; x=1775211425; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MD962DJa2d+eTZumSAmw+2SavlPnEgh1c+O5EkQB1zw=;
        b=Qn6UBzLCj1XJ+cF8re6vgTipiZbzuYeTwOyEJodUpmiQvQ4Wp6yeVkkFnfrRz/QwXW
         afDlZ7QFYyFQxk64enp+IM3lTYwA2tlVfk0f++Ts/mUu+8kUksoLhZKTzgwNWeVZb93o
         /unh3umxrVCU7ZLRR2Qh7YBoZf9+gpbMDyzfiyRP4gHfCGUY09q41+agfze/tGuD9rfl
         HrGtT89aKSMZIuh9inOkK3wuNnKUtcoVASi++39J9agqsmnj05YZX2tGoC415gaKeE+b
         9dE9tF+bl82RqxlivYRThHsyjYZLkiL75SEzittSVqBx2djmEWrRH7T6O3YOduAIGqlk
         3a0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774606625; x=1775211425;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MD962DJa2d+eTZumSAmw+2SavlPnEgh1c+O5EkQB1zw=;
        b=fdVyR/vlpUf6oG8wvCSKHoSpTsH5duyBmXDLOnyVrW3XqPnZ14fl4n7SYar3VuF0XS
         ypfEvOpmOsxYEi8RFCyYtNvvmfLXYxDfUxA9rh0s2u1hJfnsHyGYgg5vIh1z2H7VnfI+
         S/9IWAuARutH7zejW4gc8kJQbCPLqa5aM9OxsIT41KpwSAYPpIEBkzPU+TUktJ8deZBC
         bessBokk193AmcWIciQPRyBMLM7NGJr2CPl3t+KW+IZ+X2HAzI5C5zsp5TBLWYoSnb7S
         dsT/gmvPBIlqo9W+REFTFCbbwMnTN9yHFMYFjK9ECVFRBLekhXebiBgNbLBTn6ThknrL
         um3w==
X-Forwarded-Encrypted: i=1; AJvYcCV69OEoJFQ0+cHDYGGHfyKrCdc366/Mr7LUx2aQfKXZHHxIEsPW8daRlXCVJXw4J92lK6yhbE4Q4LGu@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7bbQ4PukLdLkwSwCf1CK1H6OQfKei+sVksG3YgDGWkRkUTDGz
	ZrjNMwGe9OPgotzzrw2mITDrpiv42tU2UkEzRgTPfreiDEX7er0gPueJDegGzWRjIkD95UW46+M
	6TQc8qbJeKJaOQSJCzd/grAt7jBBlUqU=
X-Gm-Gg: ATEYQzx3LueBSrfM4gBLDyBn7W6h8532KaREd5j9KMcgKcegyGs+fbpHY+EOeuYojLy
	s8kY50UvzQWIVYUCpomUfcPSzzAaj3AMkhnQf6lAtIFoIbt27hBlNpnFF44+3l+nYUbOFEFcMFA
	uKNgY71aitG5NzSMLsgwq11E4T3RxIT+T28Pu47BRi8cnfIcj+Vr7RjoKjpRXyitFNzfu7WfREQ
	5zVFoI/W3OwXiv1eF8ECgYUSej6mDpDBRs66GaaFtA2+Gqp2LBlyJz4ci1dTlGusTdIPvADo/aw
	ZGzH9D5gMeVK9tVp24GvVaEQ10MZraIe4KWUH7rRkzSb0mLzI+39/Q5hOKYZRTwmIzzhuw==
X-Received: by 2002:a05:6000:2c10:b0:439:bd70:610f with SMTP id
 ffacd0b85a97d-43b9eab26famr2859930f8f.44.1774606624710; Fri, 27 Mar 2026
 03:17:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260319141515.2053556-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260319141515.2053556-3-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdXzWFHxeyR4Z4fLUc-QhwPK1RnB5VTzQODjzoR6oDwKHg@mail.gmail.com>
In-Reply-To: <CAMuHMdXzWFHxeyR4Z4fLUc-QhwPK1RnB5VTzQODjzoR6oDwKHg@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 27 Mar 2026 10:16:38 +0000
X-Gm-Features: AQROBzA351V4-u031sU_LWBz8AfXD44IpEZr_5GEUWRa6g-PutLuycoQAmmlEFY
Message-ID: <CA+V-a8sRgOePfrEG2HfMp3XnCYXRay58s9fWjjg8yLjqYFvdnA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] pinctrl: renesas: rzt2h: Add pin configuration support
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34242-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org,bp.renesas.com,renesas.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,glider.be:email]
X-Rspamd-Queue-Id: C1BAF342588
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Geert,

Thank you for the review.

On Thu, Mar 26, 2026 at 4:34=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Prabhakar,
>
> On Thu, 19 Mar 2026 at 15:15, Prabhakar <prabhakar.csengg@gmail.com> wrot=
e:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Add pin configuration support for the Renesas RZ/T2H SoC. The RZ/T2H So=
C
> > allows configuring several electrical characteristics through the DRCTL=
m
> > (I/O Buffer Function Switching) registers. These registers control bias
> > configuration, Schmitt trigger input, output slew rate, and drive
> > strength.
> >
> > Implement pinconf_ops to allow reading and updating these properties
> > through the generic pin configuration framework. The implementation
> > supports bias-disable, bias-pull-up, bias-pull-down,
> > input-schmitt-enable, slew-rate, and drive-strength-microamp.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> > v1->v2:
> > - Updated commit description
> > - Dropped 32 bit reg access for DRCTLm registers
> > - Switched using to guard for locking in rzt2h_pinctrl_drctl_rmwq
> >   helper function
> > - Dropped using RENESAS_RZT2H_PIN_CONFIG_DRIVE_STRENGTH instead
> >   switched to using the standard PIN_CONFIG_DRIVE_STRENGTH_UA
>
> Thanks for the update!
>
> > --- a/drivers/pinctrl/renesas/pinctrl-rzt2h.c
> > +++ b/drivers/pinctrl/renesas/pinctrl-rzt2h.c
>
> > @@ -54,6 +56,16 @@
> >  #define PFC_PIN_MASK(pin)      (PFC_MASK << ((pin) * 8))
> >  #define PFC_FUNC_INTERRUPT     0
> >
> > +#define DRCTL_PIN_SHIFT(pin)   ((pin) << 3)
>
> "* 8" sounds more logical to me.
>
Ok.

> > +#define DRCTL_DRV_PIN_MASK(pin)        (GENMASK_ULL(1, 0) << DRCTL_PIN=
_SHIFT(pin))
> > +#define DRCTL_PUD_PIN_MASK(pin)        (GENMASK_ULL(3, 2) << DRCTL_PIN=
_SHIFT(pin))
> > +#define DRCTL_SMT_PIN_MASK(pin)        (BIT_ULL(4) << DRCTL_PIN_SHIFT(=
pin))
> > +#define DRCTL_SR_PIN_MASK(pin) (BIT_ULL(5) << DRCTL_PIN_SHIFT(pin))
>
> I will drop DRCTL_PIN_SHIFT(), and replace it by "((pin) * 8)" while
> applying, for consistency with e.g. PFC_PIN_MASK() above.
>
Ok, thank you for taking care of it.

Cheers,
Prabhakar

> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> i.e. will queue in renesas-pinctrl for v7.1.
>
> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m6=
8k.org
>
> In personal conversations with technical people, I call myself a hacker. =
But
> when I'm talking to journalists I just say "programmer" or something like=
 that.
>                                 -- Linus Torvalds
>

