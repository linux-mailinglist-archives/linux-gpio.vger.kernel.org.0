Return-Path: <linux-gpio+bounces-30888-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0Dq9KArYcWk+MgAAu9opvQ
	(envelope-from <linux-gpio+bounces-30888-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Jan 2026 08:55:54 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 58B6F62B56
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Jan 2026 08:55:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 1C4CB447CBB
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Jan 2026 07:47:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99DAA3446B7;
	Thu, 22 Jan 2026 07:46:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MXgidiYG"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D4CC47798B
	for <linux-gpio@vger.kernel.org>; Thu, 22 Jan 2026 07:46:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769068003; cv=pass; b=ERj9MmhBufp+qArbsapj3+lCdx0FViHoB8FvfohPfLVOjoSQy2alHlHd+vy9YrQJ0K/aLQR+Dk3t3zLM+mswdQpNtXEeCx3nZdkKXfwIuEqdaUKRTz7JVeLd+qDv3WV3QYWF2rIEpxnp8LwHlHkj/YdXLc40RrWKecbb+vg3Ltw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769068003; c=relaxed/simple;
	bh=dJIzgMSqaGLqFQXTXP8HhJp8P8L/R0j7qJDUbBs4ffg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B5TrPLpfqsUHwnswXPAjRlRUGdSnJMee5rnVfQxLW71pcypMFZmXuXA/sq7Kj1Uqvl/2sGAB+DEe+1Lwt2nqlVCjSDJtfEl9h7NnIw2TnN2jN7p09Iy6PKfIuu8dgozFIhIuIQczoByM2MHgm3w+iTDXBgU2ha0DxjHwRWRbIH8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MXgidiYG; arc=pass smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b879d5c1526so128784766b.1
        for <linux-gpio@vger.kernel.org>; Wed, 21 Jan 2026 23:46:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769067994; cv=none;
        d=google.com; s=arc-20240605;
        b=iXR9Qj+MnJa3imD9Ow/BkgxXiQNLlyi7C1CRC1HefVBv0Iw4nkMx9a/HWJx+Oa67ty
         2iNMavrq5N3g+owb56V2PXx164oeZyxJAqIlxNRAb5lG/7gPcnhlM/262ln+7SEWeieu
         hpOAxyhJUh1i6/SCP+xMTmM8TOQ0ZtBTMiQs3TkRBIR475xX0jYMXf7TiblpRvKT1ttJ
         ucyktp62RFkJjjFSntkP34TDYycJ/qDDjuo82ANPxzpuUYXPFMuExyIjcyT2ntRqL+1v
         TEHjvCYxjShzZc9Odu7MQsIQqcP4xzWo44R36LwTLSULgT32bUtgnTtUXcWslDZ8V2qG
         X58g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FNL0d7QhHFBGNXNa6G1OZ6wYSQh8Cjk4oVuGSla53Lg=;
        fh=dpUPrUTEI+q1d7brVmg3zCAkR3UuQZLvX/+sbi2ckTY=;
        b=k91Z/J4wxqSMuOUR2onEF5Zm2+bE4rKho6iiadEhT00g2LF9iLnLq/kXL5/U0aQ6vV
         X1RzF/zufYN7LNSQlo+IW6Ahlk0BadIo+FDfZaN6iIKHJOzk+5IhBkh45O1FgQZ8lmTz
         EHnmadWBrzL4YVB4S1D0Q4KFb1LzIY0N4GssSQmgZhsmvxWRVzBYI5lvfhmw5rDkbZ2g
         35eieva7JVmxT+I4wvXt83nhggzfjsDE8gAKfmRgWKPKzY0OIJ9FBlpyHFhz8B2DDSRA
         MtDChAR77nkdcav3rvYFc1foswyULzOdLOORdQBlnYt53duztqLHlba4MQn+Pf7TAPM1
         pnQA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769067994; x=1769672794; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FNL0d7QhHFBGNXNa6G1OZ6wYSQh8Cjk4oVuGSla53Lg=;
        b=MXgidiYGiGJMhIa8SSu8N0JynpnYyezsyNwFOeZs1EsQxOYllDh42fQYHARTVclSVw
         HQTDNfqGcJgYxmSiwJKPl3wN1nWB9TjQN6irkccQ7Dair3OwXcwi5XtYCr81tt6QyLtA
         AezfLdjlTydKVZioF+cp/kCddz2Us/UACwDEqTqbgdL91buA8brjsMqPcAMuFiAwXBYU
         xIWgMtuydxodwbDtun6NiyVBVufMaCm9GHPOXJulLADFBlEzIYcylr1+TPCFCc3UjFZh
         gg82y49WOoKVURuRq3QY3qpKMrqfVTXbV6KuQD85IFbM+//qGB5hzVrJvfZARyxCcWGU
         3riA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769067994; x=1769672794;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FNL0d7QhHFBGNXNa6G1OZ6wYSQh8Cjk4oVuGSla53Lg=;
        b=Rk0XqaLa4tIR9T67RED+GUyn2eL9fSF+XKBLddVeuBCzlRBfqKRGIg6ZW7fdYEo6KY
         FSkBr1Bve9aMo9pWtTYPFYLiJKnDCCcA3cXrS4uBS5YPtorehrBDUheDQ2V7zIAa5iwa
         Q9jdWTjgylaLnRbOhixDdf6uvyC7NE9/MbU0crGCB9V4+/TTxAE9WQ+qrdQtvUFdESJN
         if6jUGCaWOVu5tKkjB8KS1nNLAf9mexRZlNCYFM/jMo9AG9jk057HZ7gyOSbl0RtxkQY
         pbVDKe/WlDSEug724Bdzr2siwGhEAsfjC8YOUsXGgyM6oZVSZSXsaxtI5G7KNHbyBRvq
         /J8g==
X-Forwarded-Encrypted: i=1; AJvYcCUOOl7hHpUJLGwhg2pWqSVcVMVfyPDT2EyBSfI7yNCINytNq2Led/bF90B0G9SrTMgG7U22tXQRzXv+@vger.kernel.org
X-Gm-Message-State: AOJu0YzUolsLfA5f56tuNGoS/90SxAS3Twy6AJGfatmN2JH7oCNkEvG0
	z/cvTQZp2DYvoHJJgvFax892m3XKn8WFyfa5rYMRsKgvdt2FF4DucuOmtjq8gj+S6bEwg9sNCIJ
	wqKq1yJ0kaVLHst5XMRxMGGWh8Exwoz8=
X-Gm-Gg: AZuq6aI6ouXyyUofbVS/9DZQApBCqCDSGBR4akq6SI1A6XSom+7oz3GRsvuy6MB2R4v
	0qYSRCZWAzb0ee3SY3+xDIZG4iYos6JnMaydVLMs2rkvtWZeANu/M4D0iYt9cO9Qs26PvwPiGQz
	opbNSIC6I7Xhr3zjnO0SMh4sAeiFUl4bZgY5JjFqdx3gGBNuCklBG97i9iAUmAi6gr3waY6ypeZ
	c4pjco+4mBvY/Am9Yzz9w66DhrXn95DO7RoFMv+Vbl9aet4fl9GZR2u5SWJ+6A0SkZaTvOek/yR
	tkODhKesb0lNPLFP/lmxkrcqCn4JuTxADTcf3vLvnQHzAHAyEW/uPDg2i+1A8OzYsVO+C2w=
X-Received: by 2002:a17:907:3e93:b0:b87:2630:e67b with SMTP id
 a640c23a62f3a-b8796b83edemr1815379466b.50.1769067993696; Wed, 21 Jan 2026
 23:46:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260122010516.1200630-1-florian.fainelli@broadcom.com>
 <20260122010516.1200630-4-florian.fainelli@broadcom.com> <CAHp75Vdyfq_9sCY0t8TXst6XhcOM079y2zYprSZDX4_GTJL6AA@mail.gmail.com>
In-Reply-To: <CAHp75Vdyfq_9sCY0t8TXst6XhcOM079y2zYprSZDX4_GTJL6AA@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 22 Jan 2026 09:45:56 +0200
X-Gm-Features: AZwV_QhyFWfg8ea6FhZDCZQ9gQRL963lr5eJZKYpigdLJ823CoaZ4X1140v_9r8
Message-ID: <CAHp75VdrWp+RosNFP+S+1iSYrM9KmZ6hgn=bLV27+26C0GKH+g@mail.gmail.com>
Subject: Re: [PATCH 3/3] gpio: brcmstb: allow parent_irq to wake
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: linux-kernel@vger.kernel.org, Doug Berger <opendmb@gmail.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Christophe Leroy <chleroy@kernel.org>, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, 
	"moderated list:BROADCOM BCM7XXX ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.96 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30888-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,broadcom.com,kernel.org,lists.infradead.org];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[gmail.com,none];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andyshevchenko@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[9];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:7979, ipnet:213.196.21.0/24, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ams.mirrors.kernel.org:helo,ams.mirrors.kernel.org:rdns,broadcom.com:email,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 58B6F62B56
X-Rspamd-Action: no action

On Thu, Jan 22, 2026 at 9:44=E2=80=AFAM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Thu, Jan 22, 2026 at 3:06=E2=80=AFAM Florian Fainelli
> <florian.fainelli@broadcom.com> wrote:

...

> > -static void brcmstb_gpio_quiesce(struct device *dev, bool save)
> > +static void brcmstb_gpio_quiesce(struct brcmstb_gpio_priv *priv, bool =
save)
> >  {
> > -       struct brcmstb_gpio_priv *priv =3D dev_get_drvdata(dev);
> >         struct brcmstb_gpio_bank *bank;
> >         u32 imask;
> >
> > -       /* disable non-wake interrupt */
> > -       if (priv->parent_irq >=3D 0)
> > -               disable_irq(priv->parent_irq);
> > -
> >         list_for_each_entry(bank, &priv->bank_list, node) {
> >                 if (save)
> >                         brcmstb_gpio_bank_save(priv, bank);

> One more thing, how is "save" being used? I can't see it other than a dea=
d code.

Ah, it was a preexisted parameter, I was under the impression that it
was just added without use. Sorry for the noise.

--=20
With Best Regards,
Andy Shevchenko

