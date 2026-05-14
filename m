Return-Path: <linux-gpio+bounces-36860-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WO1xEfMHBmrFdwIAu9opvQ
	(envelope-from <linux-gpio+bounces-36860-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2026 19:35:47 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D33565455ED
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2026 19:35:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A24523006F00
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2026 17:35:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90864396D1C;
	Thu, 14 May 2026 17:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WIyUK0xp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F220B394798
	for <linux-gpio@vger.kernel.org>; Thu, 14 May 2026 17:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778780118; cv=none; b=gxw6pPg5O0Zq0VuKxgw8JCE29sXzzAtyAcKSms60g7p0FDUWURu0EkmOTh3/jSoxB2seDa83Vfj6rEljJpAiYD8f8yxbkcg704Q2YUgmrU7gYpsXuK+q6RXbHwGQEa+AdHgA9+6zIUQlVHYHFhpJcvPyVvb6FqIlnaDXWNJH3fE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778780118; c=relaxed/simple;
	bh=csxAARw7TMe4p9kUCeBN9DmScREv2ZSHrFWQS2btBrI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UBNRlB/04wwQhOlk3YB6tLxDTBAJuWEhAqdv3SsQl6E/7d8FVue42Bzlk4a5PJhOCtRuc1r5axVGI1m4Gd45NDcrv4563ur0ulpigszYm4myU5OL9x4zl/lG6uYU0BnhrJcyM5VvUQGLMfOCAVlh8RTnmB+qSfjh+NTzyIsP0v4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WIyUK0xp; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-8353ca0f1f1so49703b3a.1
        for <linux-gpio@vger.kernel.org>; Thu, 14 May 2026 10:35:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778780112; x=1779384912; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JC+WHcUhpCEgLv+z/dz5uJKI5jcxrqy0Eu1amoyfn8U=;
        b=WIyUK0xpwJjitfqZkL4ciFH0O1UeUmNjyy+6Z8DeOIHkCMX0kg/sttsqFq8LcoV5Wp
         WP7XyM7xTxDLVe0/qpUvBcYj/3weEzGpKg/6IaPo68KgCvRwVQaiEUNsbDYWE6UHaXso
         Tb0dbsopqHRtWE6ZRVBzzvAKeV6CO2/DCYTUQekX8EOppnNbz6FmiLiwXpJ+RBGtvh8m
         yrysH+YuF2gGGSyFCnG0hEC4EUgjBl1C6gkYo2qjV+mYdLk0zd/RM+PV3C+fO0xGGRFI
         yC+iHEeOvVy8FaLGnvIrjkLLRG7RNbOtuLzjdit+RP79/seDhyydaxhrc+z/3A6oybFU
         G6Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778780112; x=1779384912;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JC+WHcUhpCEgLv+z/dz5uJKI5jcxrqy0Eu1amoyfn8U=;
        b=NJuVr/Nv91xk6Bb33IAsYACJuowRNF2ARK336HNkgGUo9zcc1zgLZGVGDZKlSiENf/
         ipb9PhV0h5IFDmzLkO30jz4HC2ysQSzcHIwwe1mpnEWAHXCSIMjSnS5s53EhYyGFbL4y
         nV5+bE5U3mF81OqfGOhs4uyPYOV1tio9LdMRJwM2NkSuW/360WHc9/at6KuLyh5Mtr93
         MUAxh+XDJHaepELrvgZT0etLD60ZL/LtUHWQ6A3sVSlqdMpVGAe6Rq3AAA0aQBvzDFVL
         wUxzwK2ojGrYLouEkm2O2OwRSCSXcMpZqN+gIZvMQyRbJGIYwmuSPIXXaQhZHuWxgsxc
         oYiQ==
X-Forwarded-Encrypted: i=1; AFNElJ+kv3/+SYEybMwTLz0vkWzV6RWcJeMveSVpHmwgzVo1v3qCG1ADT/dM3YxRSOuVFYH0jpgw9s0ap05e@vger.kernel.org
X-Gm-Message-State: AOJu0YxeZH6ZXz8gz9OggXhefK2I+EG9aDK0RfjR3SR3O/qhz5FevpfY
	bUWtk4lFYNbUnRpb3qbw/TL0W5drygOrqqXDdTu6VyODNlGVTpTZGMSMAt+J/LexRZw=
X-Gm-Gg: Acq92OHEL/Y89LZsbYrwjTVXq9e5EIAs4Ex5NkEFvCeP414/IPtMc2PpRXaNRT/F//O
	42qusvOG6YBiznD9jQSN4C/0XhWaH4xQErCG5EkGLP7Fra2SQ1nE8OajBzYhf6hm+Lcp7i/Yoqx
	GslmFEH1dwa9kz5qPdPpapyVcgRouIgv0cpLuklmqQ0d+GRWDQPt3FEP11KZjPU/UtjnL7gOzKP
	5zAGzE1CPyenCGTE9903w9TicF4JYtpUbPBuJpUDKdu9J9H2RToqgrzF9z3fE+HfYUtoJsy4Klk
	Ko4/30NFtyFEjrdp/6A+EeFNdWUkJZ+W/dybPjv8cTmdzCiL5uWcSKPZRQnAAAF5mXtlmtAbMzs
	9jX8B1lmDzfOEa5CTGzWVHw0g0/9nrahvxOE01ONtfWG8dNWS1sF6osYa1pWAwwAwo5XKfnFefY
	Ww2Edi3JGkQpxZl47dTHHgP3Ryhjo=
X-Received: by 2002:a05:6a00:909a:b0:837:6bb9:acc1 with SMTP id d2e1a72fcca58-83f18dbabc2mr4476063b3a.13.1778780112051;
        Thu, 14 May 2026 10:35:12 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:30c0:f7f8:e305:407f])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19c7ed3fsm3281092b3a.45.2026.05.14.10.35.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 10:35:11 -0700 (PDT)
Date: Thu, 14 May 2026 11:35:08 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Shenwei Wang <shenwei.wang@nxp.com>
Cc: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>,
	Beleswar Prasad Padhi <b-padhi@ti.com>,
	Andrew Lunn <andrew@lunn.ch>, Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>, Frank Li <frank.li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shuah Khan <skhan@linuxfoundation.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	dl-linux-imx <linux-imx@nxp.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH v13 3/4] gpio: rpmsg: add generic rpmsg GPIO driver
Message-ID: <agYHzH-nJLl1HFIn@p14s>
References: <CANLsYkzt9xUczxSU28u-TfZAAjr0ufZKXAj8Eqfq=45gufXW3w@mail.gmail.com>
 <f7ef3417-eb84-4467-ac72-a9bc8b0c81e8@foss.st.com>
 <21de8440-adf7-454b-acfc-06e50882e075@ti.com>
 <4c526816-b127-43e7-86e9-eee4dc1152bc@foss.st.com>
 <268f8e00-91bc-43ea-ba95-077cf859e7f3@ti.com>
 <9e2492d3-8753-46c7-8db6-5f1a80b4f2e9@foss.st.com>
 <db4c18be-1c8d-4227-9fcc-1d25cec50e37@ti.com>
 <6917e3d7-8c6c-4e63-8eca-5308621ec3e8@foss.st.com>
 <afzIABSh1xtMEGbf@p14s>
 <PAXPR04MB9185BFA6E7375FAD0B15B021893C2@PAXPR04MB9185.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PAXPR04MB9185BFA6E7375FAD0B15B021893C2@PAXPR04MB9185.eurprd04.prod.outlook.com>
X-Rspamd-Queue-Id: D33565455ED
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36860-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[foss.st.com,ti.com,lunn.ch,kernel.org,lwn.net,nxp.com,pengutronix.de,linuxfoundation.org,vger.kernel.org,gmail.com,lists.linux.dev,lists.infradead.org,bgdev.pl];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mathieu.poirier@linaro.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Thu, May 07, 2026 at 07:43:33PM +0000, Shenwei Wang wrote:
> 
> 
> > -----Original Message-----
> > From: Mathieu Poirier <mathieu.poirier@linaro.org>
> > Sent: Thursday, May 7, 2026 12:13 PM
> > To: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
> > Cc: Beleswar Prasad Padhi <b-padhi@ti.com>; Shenwei Wang
> > <shenwei.wang@nxp.com>; Andrew Lunn <andrew@lunn.ch>; Linus Walleij
> > <linusw@kernel.org>; Bartosz Golaszewski <brgl@kernel.org>; Jonathan Corbet
> > <corbet@lwn.net>; Rob Herring <robh@kernel.org>; Krzysztof Kozlowski
> > <krzk+dt@kernel.org>; Conor Dooley <conor+dt@kernel.org>; Bjorn Andersson
> > <andersson@kernel.org>; Frank Li <frank.li@nxp.com>; Sascha Hauer
> > <s.hauer@pengutronix.de>; Shuah Khan <skhan@linuxfoundation.org>; linux-
> > gpio@vger.kernel.org; linux-doc@vger.kernel.org; linux-kernel@vger.kernel.org;
> > Pengutronix Kernel Team <kernel@pengutronix.de>; Fabio Estevam
> > <festevam@gmail.com>; Peng Fan <peng.fan@nxp.com>;
> > devicetree@vger.kernel.org; linux-remoteproc@vger.kernel.org;
> > imx@lists.linux.dev; linux-arm-kernel@lists.infradead.org; dl-linux-imx <linux-
> > imx@nxp.com>; Bartosz Golaszewski <brgl@bgdev.pl>
> > Subject: [EXT] Re: [PATCH v13 3/4] gpio: rpmsg: add generic rpmsg GPIO driver
> > > > >  From my perspective, based on your proposal:
> > > > >   1) Linux should send a get_config message to the remote proc (0x405 ->
> > 0xD). 2) The remote processor would respond with the list of ports, associated
> > > > >      with an remote endpoint addresses.
> > > >
> > > >
> > > > Agreed, we can scale it for multiple remote endpoints like this.
> > > >
> > > > >   3) Linux would parse the response, compare it with the DT, enable the
> > GPIO
> > > > >      ports accordingly, creating it local endpoint and associating it with
> > > > >      the remote endpoint.
> > > > > Using name service to identify the ports should avoid step 1 & 2 ...
> > > >
> > > >
> > > > Yes, but won't that make a lot of hard-codings in the driver?
> > > >
> > > > +static struct rpmsg_device_id rpmsg_gpio_channel_id_table[] = {
> > > > +    { .name = "rpmsg-io-25" },
> > > > +    { .name = "rpmsg-io-32" },
> > > > +    { .name = "rpmsg-io-35" },
> > > > +    { },
> > > > +};
> > > >
> > > > What if tomorrow another vendor decides to add more remoteproc
> > > > controlled GPIO ports to Linux, they would have to update this
> > > > struct in the driver everytime. And the port indexes (25/32/35)
> > > > could also differ between vendors. We should make the driver dynamic
> > > > i.e. vendor agnostic.
> > > >
> > > > I think querying the remote firmware at runtime (step 1 & 2 above)
> > > > is a common design pattern and makes the driver vendor agnostic. But
> > > > feel free to correct me.
> > > >
> > >
> > > You are right. My proposal would require a patch in rpmsg-core. The
> > > idea of allowing a postfix in the compatible string has been discussed
> > > before, but, if I remember correctly, it was not concluded.
> > >
> > 
> > I also remember discussing this.  I even reviewed one of Arnaud's patch and
> > submitted one myself.  This must have been in 2020 and the reason why it wasn't
> > merged has escaped my memory.
> > 
> > > /* rpmsg devices and drivers are matched using the service name */
> > > static inline int rpmsg_id_match(const struct rpmsg_device *rpdev,
> > >                                 const struct rpmsg_device_id *id) {
> > >       size_t len;
> > >
> > > +     len = strnlen(id->name, RPMSG_NAME_SIZE);
> > > +     if (len && id->name[len - 1] == '*')
> > > +             return !strncmp(id->name, rpdev->id.name, len - 1);
> > >
> > >       return strncmp(id->name, rpdev->id.name, RPMSG_NAME_SIZE) == 0;
> > > }
> > >
> > > Then, in rpmsg-gpio, and possibly in other drivers such as rpmsg-tty
> > > and a future rpmsg-i2c, we could use:
> > > static struct rpmsg_device_id rpmsg_gpio_channel_id_table[] = {
> > >     { .name = "rpmsg-io" },
> > >     { .name = "rpmsg-io-*" },
> > >     { },
> > > };
> > 
> > That was my initial approach.  We don't even need an additional "rpmsg-io-*" in
> > rpmsg_gpio_channel_id_table[].  All we need is:
> > 
> > /* rpmsg devices and drivers are matched using the service name */ static inline
> > int rpmsg_id_match(const struct rpmsg_device *rpdev,
> >                                  const struct rpmsg_device_id *id) {
> >  +     size_t len = strnlen(id->name, RPMSG_NAME_SIZE);
> > 
> >  -     return strncmp(id->name, rpdev->id.name, RPMSG_NAME_SIZE) == 0;
> >  +     return strncmp(id->name, rpdev->id.name, len) == 0;
> > }
> > 
> 
> If we encode the port index directly into ept->src, for example:
> 
>     ept->src = (baseaddr << 8) | port_index;
>

There is no rpmsg_endpoint::src.  You likely meant ept->addr.  This would work
but not optimal on two front:

(1) rpms_endpoint::addr is a u32 and idr_alloc() returns an 'int'.  As such
there is a possibility of conflict.  I concede the possibility is marginal, but
it still exists.

(2) By proceeding this way, the kernel exposes the GPIO controller it knows
about.  It is preferrable to have the remote processor tell the kernel about the
GPIO controller it wants.

I am done reviewing this revision.  Given the amount of refactoring needed, I
will not look at the code.  Please refer to this reply [1] for what I am
expecting in the next revision. 

[1]. https://lwn.net/ml/all/CANLsYkwBk0KbN-k9ce+5=oT+scdZ3nU5AOr3Fz4zT=0AFzghDA@mail.gmail.com/
 
> where baseaddr can be derived from the channel address, we can avoid the possible address conflict.
> 
> With this approach, the patch to rpmsg-core would no longer be necessary.
> 
> Thanks,
> Shenwei
> 
> > And let the rpmsg-virtio-gpio driver parse @rpdev->id.name to match with a
> > GPIO controller in the DT.
> > 
> > >
> > > If exact name matching is strongly required, then this proposal would
> > > not be suitablea.
> > >
> > > A third option would be a combination of both approaches: instantiate
> > > the device using the same name service from the remote side, as done
> > > in rpmsg-tty. In that case, a get_config message, or a similar
> > > mechanism, would also be needed to retrieve the port information from the
> > remote side.
> > >
> > 
> > I'm not overly fond of a get_config message because it is one more thing we have
> > to define and maintain.
> > 
> > Arnaud: is there a get_config message already defined for rpmsg_tty?
> > 
> > Beleswar: Can you provide a link to a virtio device that would use a get_config
> > message?
> > 
> > > Tanmaya also proposed another alternative based on reserved addresses.
> > >
> > > At this point, I suggest letting Mathieu review the discussion and
> > > recommend the most suitable approach.
> > >
> > > Thanks,
> > > Arnaud
> > >
> > > > >
> > > > > At the end, whatever solution is implemented, my main concern is
> > > > > that the Linux driver design should, if possible, avoid adding
> > > > > unnecessary complexity or limitations on the remote side (for instance in
> > openAMP project).
> > > >
> > > >
> > > > Yes definitely, I want the same. Feel free to let me know if this
> > > > does not suit with the OpenAMP project.
> > > >
> > > > Thanks,
> > > > Beleswar
> > > >
> > > > >
> > > > > Thanks,
> > > > > Arnaud
> > > > >
> > > > >
> > > > > > So Linux does not need to send the port idx everytime while
> > > > > > sending a gpio message anymore.
> > > > > >
> > > > > > Thanks,
> > > > > > Beleswar
> > > > > >
> > > > > > [...]
> > > > > >
> > > > >
> > >

