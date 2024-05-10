Return-Path: <linux-gpio+bounces-6291-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B4B78C257A
	for <lists+linux-gpio@lfdr.de>; Fri, 10 May 2024 15:16:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2E2902830AA
	for <lists+linux-gpio@lfdr.de>; Fri, 10 May 2024 13:16:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D9E012C461;
	Fri, 10 May 2024 13:16:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aihVVwj1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C413481C0;
	Fri, 10 May 2024 13:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715346983; cv=none; b=J2Dqj85GdNrMhwJDG1irddR5yj/Uyh4zTZ4bXxfkiQJAAkn9QH0NXixNycYoTCtt2Ecru9+ZraUeH04MdMKjziwszaa8lxrCNzPFuwc/v2xM220ejE3X5yJEJlyx0hRl1a5IUeQLvV5ykGcmTI6Bn9y+TgfyLDAHJOB0wapZKqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715346983; c=relaxed/simple;
	bh=s1vp/AQv0HPsNuRPL3/H5w6SZg8ScDE+PLWKilxZ1WQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pqePFxQasAVkOy4Q1vTQIUP0RfGOhIw9V8QGUe4fdgjSzwpNTKYzzfGuHHuppnjJPq9L0+ynUDnSvkXz1Yiu3YTjRWS5HWoMJC6qfBVbJbY8Ykeko5zJMoAGySt4UcN5Ka2bUgPFMSQzFynv23AFB44I7PfMrx6xD2BPFwN+MrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aihVVwj1; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a599c55055dso522721466b.0;
        Fri, 10 May 2024 06:16:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715346980; x=1715951780; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9WxWyDp0aW9RPfysDmHcwGae8sOtSjliCl9H+az3GKQ=;
        b=aihVVwj16YTKQzETzTJKaQC9Ol51hFcBU8uWPy0xutFCF1wak6LqeEL2xcM8umJPfy
         lbyX0HTdF8Vh5QD1BmFMceDP9+D41ko1+CyGvkYVbzfZ9jP00sHTFt5ZBsO7T3YKqa6z
         li2N9EpHdgSlGoVeVNXTlHiBxo7Qf7ZUcMfvs937D+XAUNoXuuybDugqTB/E8xRUyfzU
         ffraZ7YlZlNDcWTAH3YsLYVKsbD0L2BMl7QGQbpdIjlUrpRxfWtH92s6OOczyscJN4we
         KiA8r7ANXllEiWMuQOaz6d2kS3MJH1ZgeJO2GVfOXT2lbVZKPowyd7k6Scp+ZmXwZZaN
         h/fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715346980; x=1715951780;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9WxWyDp0aW9RPfysDmHcwGae8sOtSjliCl9H+az3GKQ=;
        b=Y+ndtQm/0hYPRNgHqq1UP1ce2fFiinAakPXnaAWZcgRLYfgjz99/2zLQgll810eNRQ
         yfpMVzVs4S06p+PvkD0C6khjPl7u4eMsQvQ0gzxpfghtMRPVkTDmFKAVQtimXCxVKoSV
         M0exFpUdYEU2g+hwe4jjb+sNOkgbTpNvDmZ37v9nBKpSk4Z33dJiiNP/BVrJT+S1R1W1
         kRaT8jjBdvHViZGS9a6mrHYnUoAh1fOse/H8iwtgIA5llDP5MKxfIVns14rytA8jKigb
         3mzTnOQ+PiGWxybUR93t5mc8zSdZLNq8cTgJzWfHQupga73m4fKxSQMv7Awrm0ALgvAS
         6WZQ==
X-Forwarded-Encrypted: i=1; AJvYcCXhkAb7Frzmm8cSTCrwen+4XzTeNone0kdMvn7kIbLtbw/oaHeyS4tSucnH1xhL+qlQArvPFnthawP7JLCKe15lQdmppCim3PyVF8Pp7IW5uwlrhYeC4M5zUjVZeaKi8nWsd4UDOHdm5K735/v93fAdMQCeP6e0fRYxjJE6Bopon14YWXtS/wU6s4emtdcl3rQtVxEGTPDcY5rau/5U2V3gSl4O
X-Gm-Message-State: AOJu0YwLpHY4LtczSIy2Yttu2kOt45skzHDaHEyyZcsSxL8jFmPcMqrh
	oWwGDa+J4WHGphqDJ0zHMFhZp5XbdwLlsNhjdDxLD2D/KLFoPuaWVBQEbSKAaprol+MM9M5Fqes
	hTuj/t88I5N0YJUfd9B8mFx0ygTGwO7na
X-Google-Smtp-Source: AGHT+IHqLlMHb3RzWbCGJo0qBKhJfkr4lTod5BN64yUs4Njxmi+vvrzgQEQBPIBYKN1Ps/VJbaIpLmm5lmY7A1e+0ng=
X-Received: by 2002:a17:906:348a:b0:a59:ced4:25af with SMTP id
 a640c23a62f3a-a5a2d5ccfacmr160323666b.41.1715346979747; Fri, 10 May 2024
 06:16:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240506150830.23709-1-johan+linaro@kernel.org>
 <20240506150830.23709-12-johan+linaro@kernel.org> <ZjktIrsZS-T7cm-A@surfacebook.localdomain>
 <ZjyafGz_1pY4J9C7@hovoldconsulting.com>
In-Reply-To: <ZjyafGz_1pY4J9C7@hovoldconsulting.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 10 May 2024 16:15:43 +0300
Message-ID: <CAHp75VfP2AB45mn6gB3suCAO9iT3bOWZ=7m9U7E087Lac0P3gg@mail.gmail.com>
Subject: Re: [PATCH 11/13] mfd: pm8008: rework driver
To: Johan Hovold <johan@kernel.org>
Cc: Johan Hovold <johan+linaro@kernel.org>, Lee Jones <lee@kernel.org>, 
	Mark Brown <broonie@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Das Srinagesh <quic_gurus@quicinc.com>, 
	Satya Priya <quic_c_skakit@quicinc.com>, Stephen Boyd <swboyd@chromium.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 9, 2024 at 12:42=E2=80=AFPM Johan Hovold <johan@kernel.org> wro=
te:
> On Mon, May 06, 2024 at 10:18:58PM +0300, Andy Shevchenko wrote:
> > Mon, May 06, 2024 at 05:08:28PM +0200, Johan Hovold kirjoitti:

...

> > > +static void devm_irq_domain_fwnode_release(void *res)
> > > +{
> >
> > > +   struct fwnode_handle *fwnode =3D res;
> >
> > Unneeded line, can be
> >
> > static void devm_irq_domain_fwnode_release(void *fwnode)
> >
> > > +   irq_domain_free_fwnode(fwnode);
> > > +}
>
> I think I prefer it this way for clarity and for type safety in the
> unlikely even that the argument to irq_domain_free_fwnode() would ever
> change.

If it ever changes, the allocation part most likely would need an
update and since devm_add_action() takes this type of function, I
don't believe the argument would ever change from void * to something
else. With this it just adds an additional burden on the conversion.

> > > +   name =3D devm_kasprintf(dev, GFP_KERNEL, "%pOF-internal", dev->of=
_node);
> >
> > You are using fwnode for IRQ domain and IRQ domain core uses fwnode, wh=
y OF here?
> >
> >       name =3D devm_kasprintf(dev, GFP_KERNEL, "%pfw-internal", dev_fwn=
ode(dev));
>
> This driver only support OF so why bother.

Sure, but it makes a bit of inconsistency. Besides that dereferencing
of_node might also add a burden one day we want to get rid of it or
move it somewhere else, or convert to the list_head or so.
dev_of_node(dev) in this case prevents from looking into this case.

--=20
With Best Regards,
Andy Shevchenko

