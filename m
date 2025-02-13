Return-Path: <linux-gpio+bounces-15899-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 80538A339C6
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Feb 2025 09:17:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 67CC17A3CBB
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Feb 2025 08:16:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5D7020AF72;
	Thu, 13 Feb 2025 08:17:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="oMXitEiR"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5B5D13B29B
	for <linux-gpio@vger.kernel.org>; Thu, 13 Feb 2025 08:17:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739434666; cv=none; b=b+alaEayDc3MfvPoqnOTl4W4aYsHONYewXGze4RqeT1scYe5Rq3/EwXj+LyMcoyxTUkrRvckKYsuU5ktSXQazIfpHDWYj+w4VL5diIjZOvEfoISNpnN5fJBSCHO3d7rE6plhdmLIbP68D1qYgW+G4bKUIwttO9qKa7VxEzCq/xs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739434666; c=relaxed/simple;
	bh=QIcpGwLOutIyQh32HNDYfU3g6OUWstG2YLgU9TsX+WI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q0Eov4OHK3LADaosta0ZMDCpxgOEfvgtOCoaxa1+wzNohQkAGEa4/NTwQR5+Mlf1JxDNUr8eBLNcT+g6ka/G72QA6vnFbQBmYUnzkUjJpNYc70tRdWBTt5OlDCLLgTh9Dqz2myQ46Zwomklrf0tLpINVG0mvLRpcmphcfr8+zs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=oMXitEiR; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-54504f29000so539490e87.1
        for <linux-gpio@vger.kernel.org>; Thu, 13 Feb 2025 00:17:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739434663; x=1740039463; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7fEfu8GLWbh9oVDTAIcK1Jbp7CxeZowSLouxzJ5V5kc=;
        b=oMXitEiRuwfq49pY7AKMyNT4gWyJAk1mOiy56ZYJpjaBvJBhZmbGULsaw0AYLz5r3F
         yAkKuELMX9rFljpAJDq5DltS744wcfogSP5ssNgwMMHTiVQqTSXYL0nazcsb9RcARXyD
         8+rIeFz+rhkUalzNfpGWDaG5FIlB6koJSc0R9cyArAi7TMqx+IkDe5lIqVZ8sU+57Iey
         b5gReVR2VgHONCToAgwmhhUigGi7Wfb6xVPEt1fGb/xYXC3tMqTFdPWBLjNdBy3JObgp
         xIYX2V9vu+5D9+IT+Re7VpJnmktqMKVI0fC++MOdo99D8KY6AxCKxGlT5bDn+ngnC56n
         iYKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739434663; x=1740039463;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7fEfu8GLWbh9oVDTAIcK1Jbp7CxeZowSLouxzJ5V5kc=;
        b=cWIVtNY2MI9ouBjk4n1G6FpPPZOTex+XgoXqZ4W+N8AanFAAaxRdasYFhGfFVUBUPi
         vQXxFBsJKpsRz58BOiwk65Ezw/fKpFFS92PbJ+vBytM6Rfj9JqN7Cc1DNxcdZtB/71Y2
         RnSiJSKtQ+H6nD0xlhKMH4TnGJ5U5J+6lnvh8+2b0zNWvfnci64W7JNlRSI/dCgX+ogH
         GFZyzkHBk5zgVTaSt3XQtBiLGncVqVbeDmR1JrPuJ0BbVs8/pSAqUF0hLMXOy6dI/uyd
         MrF6PoA70MnANTYw9MMXmebg9URff+6B2Ra0rHoatYf2nX0tMqrWNxgIqpkiA1WWhcQQ
         TpPA==
X-Forwarded-Encrypted: i=1; AJvYcCUxwWkLo1KQAvzW/jNJvlW6cL37C8G0k0nyWOB7vzHyEyD+pEzWG00AmzkoOhWKRIrTBOn2A21B9jVi@vger.kernel.org
X-Gm-Message-State: AOJu0YxSwSv/Yog//veys0+/f2J1cgXaSOLLCX9j56LtU4o/OJL4Dxvg
	yNjvbbuNEBZ8iQ/GCNXXizZ0tn1P3j+robr3zYaqbPTYDNEgmgKWZJQilHQajlwxU/85KXcMWKP
	niA40mUpjU0vBmggzLQZD6F2KItHk0O8tsT/a
X-Gm-Gg: ASbGncuKZF/DOCzeoHJ96GgB27zocRFjpZsWlqRPAtDu7d6/YXj86nR8SL2YpiRfjo1
	VZw0dN+e0Vu9bjk29JTH/RxtQFRKhYugbz9pTjMqK855+gBADHDYDoSmsz8eDKMLdEckZeoA=
X-Google-Smtp-Source: AGHT+IF69eZEtmq/bytiQvp5QhXzQAgT59awT8Yvq0oySfRGAni/tuvturEoI284/LivbVgt7JWAcyiW719+mfChwik=
X-Received: by 2002:a05:6512:1324:b0:545:c92:271f with SMTP id
 2adb3069b0e04-5451826ea10mr1946789e87.10.1739434662716; Thu, 13 Feb 2025
 00:17:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250120-scmi-fwdevlink-v2-0-3af2fa37dbac@nxp.com>
 <20250120-scmi-fwdevlink-v2-1-3af2fa37dbac@nxp.com> <7a29ec8f-fef8-4f1c-a2eb-16a63f2b820c@stanley.mountain>
 <20250206105218.GA22527@localhost.localdomain> <e20415aa-517c-4e72-a1c3-9c02769c1149@stanley.mountain>
 <Z6SgFGb4Z88v783c@pluto>
In-Reply-To: <Z6SgFGb4Z88v783c@pluto>
From: Saravana Kannan <saravanak@google.com>
Date: Thu, 13 Feb 2025 00:17:06 -0800
X-Gm-Features: AWEUYZmIzWqZe4wj2qpsKpM0Mnm6z_-a0UXdGuXwQ-oMTHKT5ieIi6a9LqYyhk0
Message-ID: <CAGETcx8MXpLntMu4=9qECdZJzJLJbWa8ziH8XcW=yJNDAgD=Vw@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] firmware: arm_scmi: Bypass setting fwnode for scmi cpufreq
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, Peng Fan <peng.fan@oss.nxp.com>, 
	Sudeep Holla <sudeep.holla@arm.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
	Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>, arm-scmi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, imx@lists.linux.dev, Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 6, 2025 at 3:42=E2=80=AFAM Cristian Marussi
<cristian.marussi@arm.com> wrote:
>
> On Thu, Feb 06, 2025 at 02:31:19PM +0300, Dan Carpenter wrote:
> > On Thu, Feb 06, 2025 at 06:52:20PM +0800, Peng Fan wrote:
> > > On Wed, Feb 05, 2025 at 03:45:00PM +0300, Dan Carpenter wrote:
> > > >On Mon, Jan 20, 2025 at 03:13:29PM +0800, Peng Fan (OSS) wrote:
> > > >> diff --git a/drivers/firmware/arm_scmi/bus.c b/drivers/firmware/ar=
m_scmi/bus.c
> > > >> index 2c853c84b58f530898057e4ab274ba76070de05e..7850eb7710f499888d=
32aebf5d99df63db8bfa26 100644
> > > >> --- a/drivers/firmware/arm_scmi/bus.c
> > > >> +++ b/drivers/firmware/arm_scmi/bus.c
> > > >> @@ -344,6 +344,21 @@ static void __scmi_device_destroy(struct scmi=
_device *scmi_dev)
> > > >>          device_unregister(&scmi_dev->dev);
> > > >>  }
> > > >>
> > > >> +static int
> > > >> +__scmi_device_set_node(struct scmi_device *scmi_dev, struct devic=
e_node *np,
> > > >> +                       int protocol, const char *name)
> > > >> +{
> > > >> +        /* cpufreq device does not need to be supplier from devli=
nk perspective */
> > > >> +        if ((protocol =3D=3D SCMI_PROTOCOL_PERF) && !strcmp(name,=
 "cpufreq")) {
> > > >
> > > >I don't love this...  It seems like an hack.  Could we put a flag
> > > >somewhere instead?  Perhaps in scmi_device?  (I'm just saying that
> > > >because that's what we're passing to this function).
> > >
> > > This means when creating scmi_device, a flag needs to be set which re=
quires
> > > to extend scmi_device_id to include a flag entry or else.
> > >
> > > As below in scmi-cpufreq.c
> > > { SCMI_PROTOCOL_PERF, "cpufreq", SCMI_FWNODE_NO }
> > >
> >
> > Yeah, I like that.
> >
> > -     if ((protocol =3D=3D SCMI_PROTOCOL_PERF) && !strcmp(name, "cpufre=
q")) {
> > +     if (scmi_dev->flags & SCMI_FWNODE_NO) {
> >
> > Or we could do something like "if (scmi_dev->no_fwnode) {"
>
> I proposed a flag a few review ago about this, it shoule come somehow
> from the device_table above like Peng was proposing, so that a driver
> can just declare that does NOT need fw_devlink.

Sorry, looks I replied to v1 series. Can you take a look at that
response please?
https://lore.kernel.org/lkml/CAGETcx87Stfkru9gJrc1sf=3DPtFGLY7=3DjrfFaCzK5Z=
4hq+2TCzg@mail.gmail.com/

If that suggestion I gave there would work, then that's the cleanest
approach. This patch series is just kicking the can down the road (or
down an inch).

-Saravana

