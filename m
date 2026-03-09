Return-Path: <linux-gpio+bounces-32859-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +H7BHERAr2mYSwIAu9opvQ
	(envelope-from <linux-gpio+bounces-32859-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 09 Mar 2026 22:48:52 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D13F1241DBD
	for <lists+linux-gpio@lfdr.de>; Mon, 09 Mar 2026 22:48:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B226830DA1D5
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Mar 2026 21:48:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 643B036C0A0;
	Mon,  9 Mar 2026 21:48:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HL+c+KDm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD68F36C580
	for <linux-gpio@vger.kernel.org>; Mon,  9 Mar 2026 21:48:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773092900; cv=pass; b=YM7+coXICD3TFGCWerSWFur3VLotW8+hIrlakSFnKPuk0tMnpg4IxXDHPptR0jSGhxyDf0XdZ+rGT3rc3e64yxHMhxCyBURwLbcWiE7EC82lHCuOTMY2jCBFCTqtdhZCBY7oaFRDMe7QYGgFtZ6kFIa940dY9i6QV+evRUo9Lf0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773092900; c=relaxed/simple;
	bh=reB98/yRVFc8H7HxCp3Xcemlmnv0aKaA9sTYRsUfEyA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XqlBa113okYeludLh9DQ3OwZkEXDA7BnALq5+QmnrJYTEsgdTOhf9BB9aclexH9Lzlf8tlTzpGf9Y9/PwYxvriTjEY8lmkjWrXL8UXDniuLibS5V3M5F847uApAff9MXdLPFfwfOZL+YnfimOYsPghJgjB+o6NidexeWzu8SAyM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HL+c+KDm; arc=pass smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b95c0fc928bso437664666b.0
        for <linux-gpio@vger.kernel.org>; Mon, 09 Mar 2026 14:48:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773092897; cv=none;
        d=google.com; s=arc-20240605;
        b=R78dT2l5klFTIU8818qEOQW5B+sJQSTQggZA6TvXB4tkYc1Ciw6CyshwSP+6KuvftF
         agnW6vvVq/X3VBgWJOniBt2w2FguFsJ6euyInC1AUvHxLDhFQ5/H3mmRpcrQxEROlEP4
         T2oD0+fBwf3necPZHO6dDn4XdaLDZfzofy3+SF7MONtm8yJDkzGm4FtNl7Y6uUoOraJg
         PLKKhuSMaoXlsKu2tjQNj0a2Ozd26S9/k+Q0itaFjoskdP37Vu1sJYY/KQCo6ELyX91K
         SAiNdPAIcK6UB2dRhPE4iCFAZkiyoRYI/FMHh/wzd0EwMGLSoQxkacE2qWjLW6opilIP
         wMeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+RW4Bksv15WvnsXHAkZ2+BYLVycvOxPzx1oOl5MaTG4=;
        fh=MRNynJIPG+tvPcwaa1XRlIKuklb8WBxjoNCAgykpB8g=;
        b=NVVBhmH9sFZvBEh2t2UmWlfShrk1apb8ndmv9mm1pEViKJ66Q1cpJEG1e+DjFEZfw4
         fqiGyQt8Ozd/vyKVEjsJUYcpmmV7LtgcZ0PljcqMd7+cf38zjHyxCTO+boiRFIs67KTQ
         tMlL8Ym4p5rESn2K0elsTj/eySoUy5VfHvfPollBscHideehsUsTvX9q4snG4m7tLSKA
         X63UecIvQknkvV+tmrjZjNVRJM6xCIhXnhFpDAob79OsptrxXnPWKgexerSJiv8HGq54
         5u/1/9P8w06UKcxmkVR2iKesQnGcpKWddyTx5JOjwrgedbkzWa/Q7j8Lhoo7FvYDpJPK
         gS2g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773092897; x=1773697697; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+RW4Bksv15WvnsXHAkZ2+BYLVycvOxPzx1oOl5MaTG4=;
        b=HL+c+KDmW6RROoYegpsQPGH16Jv2jXdYubq/ZbLerdGPvHm6E3pNukVDbsW/ilcmYt
         rbHQC2p2Ax2l6/s4UYnUP96u/IN+fDWV6WUjkF81TbdfEg6iCj/mxx76955oojL0SXr4
         kl9Ur/Y6aHet+lIIHbmrSd4+HVQx8UeI/Ab42le7Ko0paqKB0Dpjl2ZzRDtUAChQg/Ki
         C4Qq23SS1M1PH7e7rh5ROvvomRcEeuRG1KRfpkjsOZUStSOW0b6pnY1SCkl6znHQYUo8
         QRdBns+l3bKeCK1DP0fB+gFb+ZNR5+Vrc/q69swtpn98ittqRyv1ZIgUVraCm69s7uif
         B2VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773092897; x=1773697697;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+RW4Bksv15WvnsXHAkZ2+BYLVycvOxPzx1oOl5MaTG4=;
        b=cF/jjbWN09uupx3XzXOIn/y+ZBq5y1k6Sn5a+Cvz8QOGMhb9LdNMhKPuM2MKiS2Rh9
         Jr2iK+3iMKQoiUi/WCNSL+U9O+A14yivymsoDm/3CclPJMRF7AIYdrTU1HLKv7vWiJm8
         0kqK2ybDh4Xv8BYgFdFlZroBxDg2lSPQXJkgRw8fcJQnvvy1uZpyc8GRlYFXQB/mAsa2
         njN5C+zExiZmz5BfE17avKQWL99OjNgTsT7/Xc2iCUaAtc4VrRxeLuf+Gs0yhlvVMRj6
         7TWZA4YoG/aSK2LoFLwqsCWTjtdhw4f2QABCVa45As8swKcwRESYah7Uggq8vR+f8LrC
         6Zgg==
X-Gm-Message-State: AOJu0Yw3pdbk3zde/O1KLS20836TYDm9Nm0g2Y4IYsvPTXBIqLMDPD6S
	va1o0ObnJqEJ2RAJD4buPAC4+/CqrC6N1lrWRt+zO81nACrl+Y23wU/dJwzQEfr+QbJ9NSoSoIS
	TYbT9tNroi+Jv3iuGiU4HNpf3NihUR2A=
X-Gm-Gg: ATEYQzzID/dbw0nJyn/UedirK/o9WjznlgEe3VVavi92z0/WJnCk3MdSotA89fom1J7
	IxMyxKfnbiQCNpIubz1+3MpPtQeLeG2mP3+I7KwHdSZ4wXIMXyugjeK31eCjQf+aQ40MiDXVArg
	2Cp5oMushXRXpJ1rb3F76gYBfaOrtLuTjzQthIpyCXyf5iAkRuni0gCpYNnaeFo6FIt+kO8v5Aj
	YDP9Cqcbuh2wWsQVtO0Rk9iRj34pOBUyOzppKDBzbclT1AQEsRglLc0PNPNAToRTIn+Cp1WewsQ
	qPxlt7RWvB0DlBKH6LL8km/snt1Kjh+1Z8iTUKUmdcstuBnsjcQmHmuI3qI+yqDFWOWU0BSCXS1
	9IRRH0dTFsRtgU7HZ
X-Received: by 2002:a17:907:7ba6:b0:b94:1d92:7e8 with SMTP id
 a640c23a62f3a-b942de06f52mr753184366b.27.1773092896698; Mon, 09 Mar 2026
 14:48:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260308021201.47820-1-rosenp@gmail.com> <CAMRc=MfGkVpk9rBLvwxndjveXemY6t7nWOBX9wqZxc+Qe7aOCg@mail.gmail.com>
In-Reply-To: <CAMRc=MfGkVpk9rBLvwxndjveXemY6t7nWOBX9wqZxc+Qe7aOCg@mail.gmail.com>
From: Rosen Penev <rosenp@gmail.com>
Date: Mon, 9 Mar 2026 14:48:04 -0700
X-Gm-Features: AaiRm531jvLGP3p0QNkfjPaWbYM9v3XkvbwhlEnwIJao5lsqtECDEEmPxAwb-OM
Message-ID: <CAKxU2N8Zm6Hg-pr14RS9SCsOWGu2kF3gy4RVuQThMvM1CfLEtQ@mail.gmail.com>
Subject: Re: [PATCH] gpio: ljca: reduce struct allocation
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, Lixu Zhang <lixu.zhang@intel.com>, 
	linux-hardening@vger.kernel.org, gustavoars@kernel.org, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Linus Walleij <linusw@kernel.org>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: D13F1241DBD
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-32859-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rosenp@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[8];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Mon, Mar 9, 2026 at 2:22=E2=80=AFAM Bartosz Golaszewski <brgl@kernel.org=
> wrote:
>
> On Sun, Mar 8, 2026 at 3:12=E2=80=AFAM Rosen Penev <rosenp@gmail.com> wro=
te:
> >
> > Convert connect_mode to a flexible array member to avoid calling
> > kcalloc and to combine the allocations.
> >
> > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > ---
> >  drivers/gpio/gpio-ljca.c | 16 +++++++---------
> >  1 file changed, 7 insertions(+), 9 deletions(-)
> >
> > diff --git a/drivers/gpio/gpio-ljca.c b/drivers/gpio/gpio-ljca.c
> > index f32d1d237795..a531aaa0425f 100644
> > --- a/drivers/gpio/gpio-ljca.c
> > +++ b/drivers/gpio/gpio-ljca.c
> > @@ -63,7 +63,6 @@ struct ljca_gpio_dev {
> >         DECLARE_BITMAP(enabled_irqs, LJCA_MAX_GPIO_NUM);
> >         DECLARE_BITMAP(reenable_irqs, LJCA_MAX_GPIO_NUM);
> >         DECLARE_BITMAP(output_enabled, LJCA_MAX_GPIO_NUM);
> > -       u8 *connect_mode;
> >         /* protect irq bus */
> >         struct mutex irq_lock;
> >         struct work_struct work;
> > @@ -72,6 +71,8 @@ struct ljca_gpio_dev {
> >
> >         u8 obuf[LJCA_GPIO_BUF_SIZE];
> >         u8 ibuf[LJCA_GPIO_BUF_SIZE];
> > +
> > +       u8 connect_mode[];
>
> Please use __counted_by().
Counted by what?

__counted_by(gpio_info->num); does not work.
> >  };
> >
> >  static int ljca_gpio_config(struct ljca_gpio_dev *ljca_gpio, u8 gpio_i=
d,
> > @@ -400,22 +401,19 @@ static int ljca_gpio_probe(struct auxiliary_devic=
e *auxdev,
> >                            const struct auxiliary_device_id *aux_dev_id=
)
> >  {
> >         struct ljca_client *ljca =3D auxiliary_dev_to_ljca_client(auxde=
v);
> > +       struct ljca_gpio_info *gpio_info;
> >         struct ljca_gpio_dev *ljca_gpio;
> >         struct gpio_irq_chip *girq;
> >         int ret;
> >
> > -       ljca_gpio =3D devm_kzalloc(&auxdev->dev, sizeof(*ljca_gpio), GF=
P_KERNEL);
> > +       gpio_info =3D dev_get_platdata(&auxdev->dev);
> > +       ljca_gpio =3D devm_kzalloc(&auxdev->dev, struct_size(ljca_gpio,=
 connect_mode, gpio_info->num),
>
> I'm surprised to learn that there's no devm_kzalloc_flex() yet. I
> wanted to ask you to use it but it doesn't exist.
I'm sure a treewide commit will be applied when it gets introduced.
>
> Bart
>
> > +                                GFP_KERNEL);
> >         if (!ljca_gpio)
> >                 return -ENOMEM;
> >
> >         ljca_gpio->ljca =3D ljca;
> > -       ljca_gpio->gpio_info =3D dev_get_platdata(&auxdev->dev);
> > -       ljca_gpio->connect_mode =3D devm_kcalloc(&auxdev->dev,
> > -                                              ljca_gpio->gpio_info->nu=
m,
> > -                                              sizeof(*ljca_gpio->conne=
ct_mode),
> > -                                              GFP_KERNEL);
> > -       if (!ljca_gpio->connect_mode)
> > -               return -ENOMEM;
> > +       ljca_gpio->gpio_info =3D gpio_info;
> >
> >         ret =3D devm_mutex_init(&auxdev->dev, &ljca_gpio->irq_lock);
> >         if (ret)
> > --
> > 2.53.0
> >

