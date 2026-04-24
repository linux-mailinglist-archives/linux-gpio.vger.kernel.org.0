Return-Path: <linux-gpio+bounces-35473-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wAPHC5I062lfJwAAu9opvQ
	(envelope-from <linux-gpio+bounces-35473-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Apr 2026 11:14:58 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C01945C006
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Apr 2026 11:14:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 27A08301CCE3
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Apr 2026 09:11:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3208037D104;
	Fri, 24 Apr 2026 09:11:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="idXwK1lD"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F0D4383C8F
	for <linux-gpio@vger.kernel.org>; Fri, 24 Apr 2026 09:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777021903; cv=pass; b=bkGTZhSJe5wXc4Ozk0zYh5I0ICNJMK6DhsS5NR2x5KAJ6PYqbCQc2ANaoCr5OQCJJi/o9f/7fNWHtRN7TXddgT7Dn2O7UgEFO1IvGv0FLuFI8xPHpmR64SlpJKvYIXXzAEotNCewXxZKwwOc56n5vBGCEgGxKSHKhZnOiK1UAyY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777021903; c=relaxed/simple;
	bh=bCVvojzYqQuDyWp0cOp3N2y7Tu20jPoOeLNc1/1U9KY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eWSw6shUjOfS31wX2UZQphZqPP2wo5LUDGPXLKdyS3vCKbzHLB4KeUQwgoosEU6C5hWBb+EJTz0CZV18/bQEHkbqfTa/ghkAqPzROq7PyHhCHWNQ7VQouVh8qHnhjJim9YSY6Xa+Amz8TRqu+ZuonPHTySWiFNW2wjOWXB/BMb8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=idXwK1lD; arc=pass smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-488d2079582so88536605e9.2
        for <linux-gpio@vger.kernel.org>; Fri, 24 Apr 2026 02:11:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777021899; cv=none;
        d=google.com; s=arc-20240605;
        b=O6hLjgHklZufHMH8EQmLxWC2Ufr/L6H5Cd4w8ZyVQnZReXiBxGX/VzbcGdLU5DyykY
         Sxsci7yt6+5qbSwDlKmRwz20f2VLm7vqhwW/iBwV+IUQ2rnUjRj///vMmaSEq8mPTJ4S
         zxzyaQXYrMjUAw7tcynbVzVnAO1Wh7SjutV2vPA4Tq5cbn04fVIvAfr1q4QxF1gTU3Eu
         ZxCSeX0IOmn4a4LZoIn4fKHSsgC6Agx4+kEl0zoi7mIlfvPLDk9f6gg8jdPnXWp6CNQs
         PlOojFnkYDwh1jUSzPIxcZZrpif9oCyoYGgLMCsT4smCJwIPrYWheiLn/FpoP/uIUJq+
         +kCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=miy2q2ejB68ifuUHv9cL8PbvBuD8kpHsI5eemIqLjlU=;
        fh=722KtpS5XukMZUt6kWVQWnT6Oxg/CRenkAB2bj7ksWE=;
        b=ihJCJ3CKmO8E1Lr0FZ4G3vLMIjRyfmExC6Ip+3ri57wSimwTIAjMBbb7bku7JtQ+/t
         O1g335K4RmTbtClp3g83Qg4uR64NVSxCYvBRTzfWsRtAy3bbv59T9gJgSVonT3k1jyRj
         3o+imVpy1i4tmXmO256Q9oeFvoE1mm0Gq6mNIBeuk+jhnORw6jPdJKi/i+Zaf4NaGCdC
         r4Vn6lp4+WfaQ7KXlliZwvbq+uyHbMS+A4/9Nn9Mfb7XHZ9wMRMhD1GMhPXHtsmMrurm
         Wn9kJErOCY8y4tMdg8enpM+4gleZlTLXvT8ofavHzxRtckXe4CPGFKOESF5twrZeN1gg
         7uRQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777021899; x=1777626699; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=miy2q2ejB68ifuUHv9cL8PbvBuD8kpHsI5eemIqLjlU=;
        b=idXwK1lD12vNoVUylAds0/gXrRAjkyzpM2BoobCyIMkKNiBLwu9RENwbRvusdELl60
         X8RcOs0o/M1vgnMQpI14zGHqdCnUnE6Wdn2SyMAQm3g54IAacXJ+DNPEHEuXAvS19cwJ
         lPeBP3Oz/ADBa7AVDmuY07Sf9RFxM0zzl14JxBS0QoXyD2WG4zdAbB4wgBmb45lhFob3
         nYu3+pBYmMWx8ImQir8iwOOJnO+iNDKQMxmH7Ss1psNRZU0XgJGHwYkLZ2I8kJsfB8df
         qOWENIo0qIMA9ZFBmKU/7y2ZcWNTDi8sJZMkL9MGi3lKvL+1Qw4VFuQmjj0CNDo3/PpU
         N/QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777021899; x=1777626699;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=miy2q2ejB68ifuUHv9cL8PbvBuD8kpHsI5eemIqLjlU=;
        b=TP1kTedr7sj3c29ZY9Kn16/GbpLpwMmD6r2a1ULDzZUbDpnOkpXlFJdAlL4ZfYtcVM
         zbll3qhkQaCq50B5KX1202hcNWBOKtisMIjn7NMRdS5lPkJAjhOVqdEhS4K4UTBoV06r
         /6UrTG4zufh2plTsHtAccAxrTYQRLb+dZTkJJQct7+cJ1mIsmnhUtBuYTsOMhdu0/c7D
         MWw5SEbBbr/pfiRrdxsujEenM8XWIqSDXTvAvAn1lH0rFjLTh9YjEkhaaHAwhvj1GMZT
         SacfmkcDkURzQheAYISLgtlIRJMLVmmH9XHc5zx906OiJZfCV9NhcgL7Rbt0EH3ldFyM
         TSRw==
X-Forwarded-Encrypted: i=1; AFNElJ9GQyta+RqGTkQKrpQLbqf0Uza/l+izOiR1TK8LeYbtr0KwHtg5SwCkuRX7uKB13gWCNK314aiatje+@vger.kernel.org
X-Gm-Message-State: AOJu0Yxpj/E2MMEAf7fNJ0/feOJhC2z/TCViZzBNNNyxNYKHfeU+Ewi/
	0jSmkW+gtKHBbdxUmV6s7ZD2PMtQl1hlB5OTu4FNldKR7kq2wB8Rt8JE1WhIxvqIdzCQvfQjPnL
	CXYzN+uraH3NG54So9u0QMILVaPZHiYJMgafd
X-Gm-Gg: AeBDietjG37AHYLzQsW1H2OcI8cQaYUr5b/PoThw/oxlp/gPKwglMKguM+Jzx7f0qiP
	9FPbnU3VS9kNBqMgFI1YEov3cHTbX3SdZyAYZaJ3hY86wgfDvaZpHAD8ARVUtbr8QEdbO/tkYsz
	nKVP6ulWgSb9lARh2l8wE43kE97WsCDQhBPfBHiQE0CT0nGiVYVot4KdRgAv8xPyBl69ciUlEjJ
	O+kYvjRERgWQK3+26RfYumoJahhg7U0zHaxYiCzbRZw4VVqisHgBTdAOZchkwns3eU+LgoAeIw4
	lp1TtcPkeDSYjVm6lw4mw9Q5LN8uKgsr3/IG7DzrGdOTwI+P1LFQZRVyUlnK+t49MqbdMLqmK3a
	fMg4=
X-Received: by 2002:a05:600c:3596:b0:48a:563c:c8c5 with SMTP id
 5b1f17b1804b1-48a563cd1b2mr218141245e9.8.1777021899224; Fri, 24 Apr 2026
 02:11:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260413182456.811543-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260413182456.811543-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdWJCyurtvXfUFw8NA7RONgtf9XqqWvrcg0iWjPBCutSEA@mail.gmail.com>
 <CA+V-a8vpkh_+Ka5mk-kewRXJc34oXFc5_4VgHUY=RU5YAFS8uw@mail.gmail.com> <CAMuHMdXtccbEZ0Bd=A0kvC5sg3YzMdKmVuiYrVpJMXpT2zqUYg@mail.gmail.com>
In-Reply-To: <CAMuHMdXtccbEZ0Bd=A0kvC5sg3YzMdKmVuiYrVpJMXpT2zqUYg@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 24 Apr 2026 10:11:12 +0100
X-Gm-Features: AQROBzDFyS3biKTrtU7_Eq2n7MWHBnnukWxEIubfoSLdXNDL5SPcwM233GIlJdk
Message-ID: <CA+V-a8u7GRTZBq2AdPa0Hmm7MCGsNTkcrjRn9F0BkFeHHOOKzw@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] pinctrl: renesas: rzg2l: Handle RZ/V2H(P) IOLH
 configuration in PM cache
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linus Walleij <linusw@kernel.org>, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 7C01945C006
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-35473-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[8];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,renesas.com:email,mail.gmail.com:mid,linux-m68k.org:email]

Hi Geert,

On Fri, Apr 24, 2026 at 9:27=E2=80=AFAM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hu Prabhakar,
>
> On Fri, 24 Apr 2026 at 10:22, Lad, Prabhakar <prabhakar.csengg@gmail.com>=
 wrote:
> > On Wed, Apr 22, 2026 at 1:04=E2=80=AFPM Geert Uytterhoeven <geert@linux=
-m68k.org> wrote:
> > > On Mon, 13 Apr 2026 at 20:25, Prabhakar <prabhakar.csengg@gmail.com> =
wrote:
> > > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > >
> > > > Include PIN_CFG_IOLH_RZV2H in the IOLH capability checks when savin=
g
> > > > and restoring pin configuration registers.
> > > >
> > > > On RZ/V2H(P), the IOLH configuration is defined by the
> > > > PIN_CFG_IOLH_RZV2H capability. The previous implementation did not
> > > > account for this, causing the IOLH registers to be skipped during P=
M
> > > > save/restore.
> > > >
> > > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.c=
om>
> > >
> > > Thanks for your patch!
> > >
> > > > --- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> > > > +++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> > > > @@ -3033,7 +3033,8 @@ static void rzg2l_pinctrl_pm_setup_regs(struc=
t rzg2l_pinctrl *pctrl, bool suspen
> > > >                 }
> > > >
> > > >                 caps =3D FIELD_GET(PIN_CFG_MASK, cfg);
> > > > -               has_iolh =3D !!(caps & (PIN_CFG_IOLH_A | PIN_CFG_IO=
LH_B | PIN_CFG_IOLH_C));
> > > > +               has_iolh =3D !!(caps & (PIN_CFG_IOLH_A | PIN_CFG_IO=
LH_B |
> > > > +                                     PIN_CFG_IOLH_C | PIN_CFG_IOLH=
_RZV2H));
> > >
> > > Unless I am missing something, PIN_CFG_IOLH_RZV2H is only ever set fo=
r
> > > dedicated pins on RZ/V2H and RZ/G3E, so this change does not have any
> > > impact for now?
> > >
> > Agreed I will drop the changes from rzg2l_pinctrl_pm_setup_regs() and
> > send a v3 for this patch only.
>
> No need to resend, I will drop it while applying.
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> i.e. will queue in renesas-pinctrl for v7.2 with this fixed.
>
Thank you for taking care of it.

Cheers,
Prabhakar

