Return-Path: <linux-gpio+bounces-33948-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wGdiIJTRvWm8CQMAu9opvQ
	(envelope-from <linux-gpio+bounces-33948-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 21 Mar 2026 00:00:36 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AD962E22D2
	for <lists+linux-gpio@lfdr.de>; Sat, 21 Mar 2026 00:00:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ACA2430420A4
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Mar 2026 23:00:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46EE53806D6;
	Fri, 20 Mar 2026 23:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LUXTnEN3"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A7FA2D5A19
	for <linux-gpio@vger.kernel.org>; Fri, 20 Mar 2026 23:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774047620; cv=pass; b=tUQ+a6FNOJ8NdPq9PDZB4g35HRTeV1UpKqMiU7laNM6q3ytwEHEwgHUYnPbjcOc14tgptkXmmEtiiCDZIxu/4mfoE7oq/Xr9LIOHkOWeK+87WLACxtY7sgp9VVOSrFNYTkm8nQc3zOWvIdf9q8IREkY3Gdnznu2ILOp6JYHLRF4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774047620; c=relaxed/simple;
	bh=mv+mEa8lYPVTeU4UjW5mpF2vNDEGKAmCTJPdr0jAXo4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mlZE9B+XlqasnFbEXjMHHaxwi1UhboDtKBBs0RFGMa0uRVmvZj2s+gSKHxMFAosJSXnMYESzFoW38mZebq8QiTnP9iVxN5R/dUKKJGiA9qNsmAeKf7QbNZmmOAUYHrHZHKT0F+hyZH7+4Ub1FgkxYoHO4ToC/Xu6K3t2OypPWow=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LUXTnEN3; arc=pass smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b9358bc9c50so310978466b.1
        for <linux-gpio@vger.kernel.org>; Fri, 20 Mar 2026 16:00:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774047616; cv=none;
        d=google.com; s=arc-20240605;
        b=M1BLMmaD7hx0dGiZLGlXgbIFmtFd5VvIxLWeaPyvikQk9wMlPHW3DoTaxtxrlzolfW
         mbwsjJzVs74vufFb9YYzQBb+T3/PRI4q+TNL5gGysZwL2CiLTJ8fR3csOa4W/f8l+i6q
         ITdCWRiqr7pT69Obq0pBTh8EM8OGl67Yb1GmHxPKM/gB4A1JDtijigeVNTyZ7HUN6j+p
         oNxbnSdTkATE+VhDprP8ZvHyQ/ema4kOX3pQR4ibxtu4efuCz77v1Xg4eL385j6H3YPE
         T9xe+u90wmWK/+2T9XUg9LHjEpn1XMm130wt6nZJlbbt8/QEK+l0646ovf94rU1sQw5k
         Eltg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pAWHlHvrO0epzpavXwEL2ZZmeMxmfsRjc8R4FrsxYJ0=;
        fh=qTkPFmFVUsw2nubQ+ESUuU5fgXboWkS1/2Vh52dZ+kw=;
        b=KHcjEbgsmF1DGOxlkeQ9qEQ/vwdZtTgFAQ7HzNWw5xy4JJcXXcNTJj0rgIQhoDJvmk
         sf02EVu5t5TIt5S4RCO19S5EKzWyxZPbm6jguCstcXuyCb0OXRvEx84VfgoVrAvp44Og
         /SLOgcsVdzGkdwSzncPe3eVMKDrm917XeTzvm0sv5tS5Kdr5rLi1TdqBzyjDsqvPp72m
         FRUj2n+SmI1YRLt91jV6gCznLtXmHq2Xvnkksqvtqis6fLMN1Z0X4MPQD44zDtIAyCNc
         RdH6LEoUATfVhKGoVr3SYiB9mFsp7kbaLs0fmTn6GjDvSSxeiQ0Q1BMmTWY1auIYVlWG
         FeZg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774047616; x=1774652416; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pAWHlHvrO0epzpavXwEL2ZZmeMxmfsRjc8R4FrsxYJ0=;
        b=LUXTnEN3Qk9unsOn8b98vV3YnIWZZahvBT19hYJeUIoOJE7ale37jOHvqU0eMyRG6+
         mXC0mrTN/WODNjA0BXLS9d/OKuyENOkVZIKgj3vweFGIMr7010/M6bZ8CZa0cMrcmYPZ
         M2GajskBhhSCkQDRBCdbE9NgrG+0rkNhMGQEqW41/gTi4AmLQP6MnyRWukEnfFNUL5cH
         ubnSYoTw3s3/eBXie8g6zZC7YpDcMpY73+rcKdcqdf2HhtC1ELdHmmNJkwzL0vXUbknu
         ZIZVv0uDkAlnl43o1a1cAuWrygNu8rxsk1t0PKXD/E8XBOLtJ5+BlKmM0HXaTJp5F4bA
         fLBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774047616; x=1774652416;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pAWHlHvrO0epzpavXwEL2ZZmeMxmfsRjc8R4FrsxYJ0=;
        b=sTDua0zAAcYe0oBHsXisMUcAxy+v1MuvlXWDM7tbBGKsFh+KQro9efTJ5AprNOC5ON
         cfVXhM/1hSehAXMbR0uvtbLEDzS1wUBaz6NUNfnmRmpqWDaGw8gmSBVHWFh7+x/FjIj0
         ZJyFUfVpmZpp0pCLvS5KIx4DoTF/A7GUYSkYhqzJSjtc56lWWwsB/44rJn1GGr4ko5//
         EKGWvpgb8dVXvrmD3Vs0wqERCASDyDOolLgMeVKnQJHtpRm05ot+s8+YyuCz1Whi3slo
         E3Sbgx6Ptqiv5zkvNSy4AftQgecV4S5DM1ECyzTZyGgvTOUzalUdi5btPQUBzombPnyb
         CNlg==
X-Gm-Message-State: AOJu0YzFNHHySVEW7LAlQ8mqjvQVA4xs/HX+HnHKVs11g9R+B0ewNfFl
	hEUNjj+M0CrH82g/OqWbIBm12Oan5WRpwL3qU+9PKT5HWrg5YHGi4hI6MpPhQK+UYJUpTy3qi+H
	Wnf9i0Q5ZGkZk/RxUPisYOgUAwqdDLRs=
X-Gm-Gg: ATEYQzyPF+BFXKtIJklcxWxWf3OR6wYXd3jkPFCJaTkRdYllwX4dGnSam1/Y0ZhbvEW
	UOHKisaaUzGsUiZWQ+khL0Co/7xRpfa6RfV9xAznwHL4NYFws6088/BcE0MFkEF/pgVhtHHIl0e
	VWDDxWDM6ZwUJ6kzItfj5PbVFAAtjF02CiZv3taHI0/zPllC671qEmfOKiAEK2dKYC70BBXWgc1
	/8F8J3MtFdgCdie20WVaotgDvPYxEY9zumSK4YEfS++voZjzRsSB7cOvTW59hvAQiM9g8BWzq98
	D2JXh+wpvx0c9qtQU7hXRtVgmKTSadjaPEJorTCBuwJgWax58iYEofKWO+VmCCr9thW6wcMgGaU
	eC8n8Cg==
X-Received: by 2002:a17:906:490:b0:b98:e4:6d1f with SMTP id
 a640c23a62f3a-b982f36d94bmr279801466b.40.1774047615630; Fri, 20 Mar 2026
 16:00:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260319000558.22108-1-rosenp@gmail.com> <202603201104.8D7B8A1@keescook>
In-Reply-To: <202603201104.8D7B8A1@keescook>
From: Rosen Penev <rosenp@gmail.com>
Date: Fri, 20 Mar 2026 16:00:04 -0700
X-Gm-Features: AaiRm50Lq9aViRrhhRsDErlXez4p8-8WBaip7HhoqPszk6Y0R8DvNbHvdtxBwA0
Message-ID: <CAKxU2N8ZZp5fcCWfMaqZ9VKwNQ3a06fsQPXpBQa-d1N07zPGng@mail.gmail.com>
Subject: Re: [PATCH] gpio: mockup: allocate lines with main struct
To: Kees Cook <kees@kernel.org>
Cc: linux-gpio@vger.kernel.org, Bamvor Jian Zhang <bamv2005@gmail.com>, 
	Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	"open list:KERNEL HARDENING (not covered by other areas):Keyword:b__counted_by(_le|_be)?b" <linux-hardening@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33948-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,kernel.org];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rosenp@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid]
X-Rspamd-Queue-Id: 1AD962E22D2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 20, 2026 at 11:10=E2=80=AFAM Kees Cook <kees@kernel.org> wrote:
>
> On Wed, Mar 18, 2026 at 05:05:58PM -0700, Rosen Penev wrote:
> > Remove no longer needed kcalloc to simplify allocation.
> >
> > Added __counted_by along with a counting variable to get extra runtime
> > analysis.
> >
> > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > ---
> >  drivers/gpio/gpio-mockup.c | 17 ++++++++---------
> >  1 file changed, 8 insertions(+), 9 deletions(-)
> >
> > diff --git a/drivers/gpio/gpio-mockup.c b/drivers/gpio/gpio-mockup.c
> > index a7d69f3835c1..a907ce28cbbb 100644
> > --- a/drivers/gpio/gpio-mockup.c
> > +++ b/drivers/gpio/gpio-mockup.c
> > @@ -52,10 +52,11 @@ struct gpio_mockup_line_status {
> >
> >  struct gpio_mockup_chip {
> >       struct gpio_chip gc;
> > -     struct gpio_mockup_line_status *lines;
> >       struct irq_domain *irq_sim_domain;
> >       struct dentry *dbg_dir;
> >       struct mutex lock;
> > +     int nr_lines;
> > +     struct gpio_mockup_line_status lines[] __counted_by(nr_lines);
> >  };
>
> In the cases where a new counter variable is being added to the struct,
> I think it might be better to have those be unsigned.
>
> >
> >  struct gpio_mockup_dbgfs_private {
> > @@ -436,15 +437,18 @@ static int gpio_mockup_probe(struct platform_devi=
ce *pdev)
> >       if (rv)
> >               name =3D dev_name(dev);
> >
> > -     chip =3D devm_kzalloc(dev, sizeof(*chip), GFP_KERNEL);
> > +     chip =3D devm_kzalloc(dev, struct_size(chip, lines, ngpio), GFP_K=
ERNEL);
> >       if (!chip)
> >               return -ENOMEM;
> >
> > -     mutex_init(&chip->lock);
> > +     chip->nr_lines =3D ngpio;
>
> Besides the new variable being meaningless for negative values, there's
> a strong hint about its type even from the counter used to perform the
> calculation (u16):
>
> static int gpio_mockup_probe(struct platform_device *pdev)
> {
>         ...
>         u16 ngpio;
>         ...
>         rv =3D device_property_read_u16(dev, "nr-gpios", &ngpio);
>         ...
>         gc->ngpio =3D ngpio;
>         ...
>         chip->lines =3D devm_kcalloc(dev, gc->ngpio,
>                                    sizeof(*chip->lines), GFP_KERNEL);
>
> But this begs the question: why add nr_lines when ngpio is already part
> of the struct:
Maintainers for some inexplicable reason want an extra variable for
__counted_by works.
>
> struct gpio_chip {
>         ...
>         u16                     ngpio;
>
>
> ?
>
> -Kees
>
> --
> Kees Cook

