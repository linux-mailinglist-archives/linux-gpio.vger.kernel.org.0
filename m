Return-Path: <linux-gpio+bounces-32153-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iMuAKwMNnmkfTQQAu9opvQ
	(envelope-from <linux-gpio+bounces-32153-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Feb 2026 21:41:39 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E02918C74B
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Feb 2026 21:41:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3D1EA309DDE9
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Feb 2026 20:41:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 861F333A9F7;
	Tue, 24 Feb 2026 20:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xSZ3HUu+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94CAC33A9DD
	for <linux-gpio@vger.kernel.org>; Tue, 24 Feb 2026 20:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771965689; cv=pass; b=RqpZDUALuEcRx3uBdcpm1PZ7gPpcHaB9l9MHrDKH0itj55Gob7cMZRKlZ0Y6f9+Aq+AYY9rXMvQIiZ8JeDIlTCLQ7ou9T6M4RH7mbWLtu7qVdbKNeRwv69g8zHbpbhOD97vhXuSESnYc9l+MBFE3gokg9PMMQgmfLeMuS0JEB+k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771965689; c=relaxed/simple;
	bh=yQX0QV89eK/kIauizaoFSMFTRwwcZcFoSH8ajXCreAc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lLC4jSf6XMUohg1PQLf9vkGoePnhpkbTWFO6OFd0oEVGtIwZx54OqfQiiNxn/yLP68esorBgEsbLEpTRDrjo/PJaP9y5L43kKyh476YgBqBHNNvjNeTLTroSb3ZU4MSphn4Mya3qDENquQ40UNePp4Qd6PNArOWzWz8dquwvgt4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xSZ3HUu+; arc=pass smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-65f812e0c83so573580a12.2
        for <linux-gpio@vger.kernel.org>; Tue, 24 Feb 2026 12:41:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771965686; cv=none;
        d=google.com; s=arc-20240605;
        b=A0v3lYURO9D/URg4kpu+TpxH/RK7rAGJrNhFSzA37Pu9ePlh8Y+H82GTxARBGxlSmR
         Y+uJo0XXB169HkNqyQ5litMIvLkAo+O+LaiImWkWqT3KAc2+E+TiRcUgWd3xrPPlOmiT
         Ch/UR+9uezfoEBe74iFQ7maXFm4jnFLRpi7sh6PZ03PASeeGJea9JLuPBdsO7NI0idEG
         zbcvDSbCYKabyFaGlB1fHiJ59zWVqSupqpSo+T6IpGIuBYlRb6bYZc+OzC2MokoQkxx4
         yjBIJ02s5AKrmpEt5EG/dOEgYdYmi6S5zqs/8MEHcNImFNMcdPKvAfk5fCekzlsueQLG
         U2Dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jNTWDS7xIFhn1fF1oG2R6ESQZOh+RfZzpB4H54GaJZw=;
        fh=q/aTxcf2bA1n8/6XJTehGH73mR83Ky+47rqSaR4ihww=;
        b=QJ6yTm8glToVG/MJBUPHE1BeHbJ0ZxO+GQCvoLR7ZVsIT/hOQQWUFdJNq1S10W4W/k
         KJpAzewte4Hl54VTblBZYgqKPd99qqgkmmrvARRz6bEI9XUrNkC7nr9FjxTwLeu+tIE+
         dFjiznx8e3V3ClQe9XrkAb2A3sGbinUFKhaqrgwTkBTWD88EMCcMcGsCYRPTC7G6OIVw
         wJT0QgvEZpqJ6Lksn1yT4LvnCTHs8rb51dMH6UPJWPcdKL8NUKOghWhuAuBxL8NkcLGV
         DPC7EcxDQRYSAGtfHkjE1C5X2keFPP5atYmW1iSa5SxdoVmHBCJliNx19DzEuEe47oEy
         iuiQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1771965686; x=1772570486; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jNTWDS7xIFhn1fF1oG2R6ESQZOh+RfZzpB4H54GaJZw=;
        b=xSZ3HUu+eCl/eUO6Z4zPOuLB9MX8E3jQ5R+vMSjRNi/uxZ6z7tKHN/kUi2GQOkU/f0
         CKky/yGmq0X1tr/dJXbrtXUH7vx4n25kbc02Lnyg7dS/lOnAzRD+1vG9mpUpzgsudCbI
         lOP1FVl7pjbnuY49ZReT1sFl0LF2UkZdxpV5HnIXWtA3817W/+/2jON5zLwIUXNaCOX6
         4qDCWtVW5xm6baXslE/0WLgOIU4ZSvRJvZ1h6A/Fw0SmaZnGIBcw2/REGNVC53mNR3je
         KA1skizUc8L47cwHTOmjuMHJPy+EWIT/PNQgt3kJNkxJVqTLccbHhNZeh5gSks8D2DHX
         SbvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771965686; x=1772570486;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jNTWDS7xIFhn1fF1oG2R6ESQZOh+RfZzpB4H54GaJZw=;
        b=V/wLsSnjz3ZtpFVwW0ftXcVsrdZuXuUSBCjrtFB7tSvv/Ttv5c+hvZwcFdUr8KUn3r
         xJ5qGl3OsZ6CMmoyTgQ+EPk18yGcYRaEEWmuShaqgF3yPQlm+51G8nYlAc97rPkBSkbh
         jeJdK+wkI0uPX8LkvN17Chc1YR2geaKrh01iBlK3jVcwz2wbRddgTWJxsj2D1sPV9+xo
         Qr3UDem2gd1q0qy8YG1JYsd+dz5zDVS+0/+YtBgObwIS9VdkowMgCJWzqroKHPwDrMUG
         aPGqMEOfdPyBfzWIFdgSu+72tkaUQv6NkwdoVNa6TvD2k6wTb3KVbbLJWKBdURm6hd4s
         4Cuw==
X-Forwarded-Encrypted: i=1; AJvYcCUYuj7pHrsNzLEYF9FdZzJp750P+SORJ6deBw712dCOvzFxtxFvkWci6MrrI8keCaMgMKV5eXgh4oZh@vger.kernel.org
X-Gm-Message-State: AOJu0Yxpc0b0HvwNt8gzmlNPhr7Ma1t8RGfmQs4wT5Y/GpRaRE0iVKdb
	wh/8zS9+bTe0kgnM4bjF3tU6XHRzdXF0c6naXrq4v2ZE8QpoFZ45lVhILoFiOMRn6R4T260Z7ql
	meBLu5THSDhbZJ7e6w6if4bNP5ZBBnG7+uCzn1RA+tA==
X-Gm-Gg: ATEYQzy/F3/QMqiJsHfmNAtSZm5yIDgSEIPK2pO1CG1egtqDX/U7GkQQnURfXoOcdaM
	ppSZLgZUTotYfmM5g+Xte56QlJitMRHPK2LpTKnhXIwD38WWcMNtbZTeK05Uw0cLI1T/huCgzvB
	xRqcz3N02B6LwXQ4xHswxQkpg3Y+WhnXo/LkKk4GG+SUVUknX16yDc0iBWNJ0K8cozlz7tJuq8I
	DYzUonLeCUgraaPlvMtZ6bgxscBSOrqz3YUXZAjGJgY7q9UgT+A63jIsp0X1MENg3UzsYIu5Lni
	KKqg3YQ2to95ZLQN+ttYMd4EcjIQ2YKIGg1BLORwPw==
X-Received: by 2002:a17:907:9716:b0:b8e:a024:1c81 with SMTP id
 a640c23a62f3a-b908196fb16mr909923266b.7.1771965685358; Tue, 24 Feb 2026
 12:41:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260212213656.662437-4-shenwei.wang@nxp.com> <aae7c851-a93b-4d57-a118-43c6e68c4790@foss.st.com>
 <13f9d767-61d6-4e29-b36e-6dcc860ccb11@lunn.ch> <fd257c80-d97f-45b0-a12f-3a1888ba81db@foss.st.com>
 <396819f2-dd00-4c09-8bc7-c035a5282a56@lunn.ch> <PAXPR04MB9185A908F5090F0CA4FF05F78968A@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <b21b9ee5-d84e-47f8-86b5-c111ecc3d43d@lunn.ch> <PAXPR04MB918576D67A268E59242964A08968A@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <CAD++jLkUVFckLTq=SoivNFoFymhJo4KM=qGmajFcv9T9+7tPmg@mail.gmail.com>
 <b4c422ce-3538-40aa-8bfa-b70f02774b5d@foss.st.com> <nbzdtngifwrx2kyu4tsiwwua5v4i5cjtaotemq5hubaets3bcn@fk25twf5rv6x>
 <PAXPR04MB9185588C1DB71B1FEFA1DEE38974A@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <CANLsYkxAwgG1WkMRr8EJZuSUnN_jKVnsWhWTakVqhvtMBO365A@mail.gmail.com> <PAXPR04MB91851D3DA6A92669CB5926A18974A@PAXPR04MB9185.eurprd04.prod.outlook.com>
In-Reply-To: <PAXPR04MB91851D3DA6A92669CB5926A18974A@PAXPR04MB9185.eurprd04.prod.outlook.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Tue, 24 Feb 2026 13:41:14 -0700
X-Gm-Features: AaiRm52VdXaBjzzgmhpL1Z-g6JThXBNeXEmeramA_XtCruXiC4qI2WpVWSvfPHI
Message-ID: <CANLsYkw-8ERXy3v8Sv55Cpq=+41Toez3EjLMbENAkavvr8STeQ@mail.gmail.com>
Subject: Re: [PATCH v8 3/4] gpio: rpmsg: add generic rpmsg GPIO driver
To: Shenwei Wang <shenwei.wang@nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>, 
	Linus Walleij <linusw@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
	Bartosz Golaszewski <brgl@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <frank.li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Shuah Khan <skhan@linuxfoundation.org>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, 
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>, 
	"imx@lists.linux.dev" <imx@lists.linux.dev>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, dl-linux-imx <linux-imx@nxp.com>, 
	Bartosz Golaszewski <brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32153-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,foss.st.com,lunn.ch,lwn.net,nxp.com,pengutronix.de,linuxfoundation.org,vger.kernel.org,gmail.com,lists.linux.dev,lists.infradead.org,bgdev.pl];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mathieu.poirier@linaro.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	NEURAL_HAM(-0.00)[-0.995];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 6E02918C74B
X-Rspamd-Action: no action

On Tue, 24 Feb 2026 at 13:17, Shenwei Wang <shenwei.wang@nxp.com> wrote:
>
>
>
> > -----Original Message-----
> > From: Mathieu Poirier <mathieu.poirier@linaro.org>
> > Sent: Tuesday, February 24, 2026 12:10 PM
> > To: Shenwei Wang <shenwei.wang@nxp.com>
> > Cc: Bjorn Andersson <andersson@kernel.org>; Arnaud POULIQUEN
> > <arnaud.pouliquen@foss.st.com>; Linus Walleij <linusw@kernel.org>; Andr=
ew
> > Lunn <andrew@lunn.ch>; Bartosz Golaszewski <brgl@kernel.org>; Jonathan
> > Corbet <corbet@lwn.net>; Rob Herring <robh@kernel.org>; Krzysztof Kozlo=
wski
> > <krzk+dt@kernel.org>; Conor Dooley <conor+dt@kernel.org>; Frank Li
> > <frank.li@nxp.com>; Sascha Hauer <s.hauer@pengutronix.de>; Shuah Khan
> > <skhan@linuxfoundation.org>; linux-gpio@vger.kernel.org; linux-
> > doc@vger.kernel.org; linux-kernel@vger.kernel.org; Pengutronix Kernel T=
eam
> > <kernel@pengutronix.de>; Fabio Estevam <festevam@gmail.com>; Peng Fan
> > <peng.fan@nxp.com>; devicetree@vger.kernel.org; linux-
> > remoteproc@vger.kernel.org; imx@lists.linux.dev; linux-arm-
> > kernel@lists.infradead.org; dl-linux-imx <linux-imx@nxp.com>; Bartosz
> > Golaszewski <brgl@bgdev.pl>
> > Subject: [EXT] Re: [PATCH v8 3/4] gpio: rpmsg: add generic rpmsg GPIO d=
river
> > On Tue, 24 Feb 2026 at 08:56, Shenwei Wang <shenwei.wang@nxp.com> wrote=
:
> > >
> > >
> > >
> > > > -----Original Message-----
> > > > From: Bjorn Andersson <andersson@kernel.org>
> > > > Sent: Monday, February 23, 2026 8:43 AM
> > > > To: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
> > > > Cc: Linus Walleij <linusw@kernel.org>; Shenwei Wang
> > > > <shenwei.wang@nxp.com>; Andrew Lunn <andrew@lunn.ch>; Bartosz
> > > > Golaszewski <brgl@kernel.org>; Jonathan Corbet <corbet@lwn.net>; Ro=
b
> > > > Herring <robh@kernel.org>; Krzysztof Kozlowski <krzk+dt@kernel.org>=
;
> > > > Conor Dooley <conor+dt@kernel.org>; Mathieu Poirier
> > > > <mathieu.poirier@linaro.org>; Frank Li <frank.li@nxp.com>; Sascha
> > > > Hauer <s.hauer@pengutronix.de>; Shuah Khan
> > > > <skhan@linuxfoundation.org>; linux-gpio@vger.kernel.org; linux-
> > > > doc@vger.kernel.org; linux-kernel@vger.kernel.org; Pengutronix
> > > > Kernel Team <kernel@pengutronix.de>; Fabio Estevam
> > > > <festevam@gmail.com>; Peng Fan <peng.fan@nxp.com>;
> > > > devicetree@vger.kernel.org; linux- remoteproc@vger.kernel.org;
> > > > imx@lists.linux.dev; linux-arm- kernel@lists.infradead.org;
> > > > dl-linux-imx <linux-imx@nxp.com>; Bartosz Golaszewski
> > > > <brgl@bgdev.pl>
> > > > Subject: [EXT] Re: [PATCH v8 3/4] gpio: rpmsg: add generic rpmsg
> > > > GPIO driver On Mon, Feb 23, 2026 at 03:24:43PM +0100, Arnaud POULIQ=
UEN
> > wrote:
> > > > > On 2/22/26 15:48, Linus Walleij wrote:
> > > > > > On Fri, Feb 20, 2026 at 7:57=E2=80=AFPM Shenwei Wang
> > > > > > <shenwei.wang@nxp.com>
> > > > wrote:
> > > > [..]
> > > > > >
> > > > > > Is it generic? If it is not, let's call it "NXP rpmsg GPIO driv=
er"
> > > > > > and rename files etc accordingly. Maybe it can share code with
> > > > > > the actual generic RPMSG driver once that arrives, that is more
> > > > > > of a library
> > > > question.
> > > > >
> > > > > I would like to (re)express my concerns regarding the creation of
> > > > > an NXP-specific driver. To clarify my concerns, ST, like probably
> > > > > some other SoC vendors, has rpmsg-gpio and rpmsg-i2c drivers in
> > > > > downstream with plans to upstream them.
> > > > >
> > > > > If we proceed in this direction:
> > > > >
> > > > > -Any vendor wishing to upstream an rpmsg-gpio driver might submit
> > > > > their own platform-specific version.
> > > > >
> > > > > - If NXP upstreams other rpmsg drivers, these will likely remain
> > > > > NXP-centric to maintain compatibility with their legacy firmware
> > > > > and the nxp-rpmsg-gpio driver, leading to platform-specific
> > > > > versions in several
> > > > frameworks.
> > > > >
> > > > > - The implementation will impact not only the Linux side but also
> > > > > the remote side. Indeed, some operating systems like Zephyr or
> > > > > NuttX implement the rpmsg device side (Zephyr already implements
> > > > > the
> > > > > rpmsg-tty)
> > > > >
> > > > > Maintaining a generic approach for RPMsg, similar to what is done
> > > > > for Virtio, seems to me a more reliable solution, even though it
> > > > > may induce some downstream costs (ST would also need to break
> > > > > compatibility with legacy ST remote proc firmware).
> > > > >
> > > >
> > > > Could the virtio-based mechanism be used directly (without rpmsg)?
> > > >
> > >
> > > Technically, yes=E2=80=94it's possible to use the virtio mechanism di=
rectly without
> > rpmsg.
> > > It=E2=80=99s a bit like talking straight to the IP layer without invo=
lving TCP
> > > or UDP: doable, but at a lower=E2=80=91level approach.
> > >
> > > As for the idea of gpio=E2=80=91virtio, which could be an optional so=
lution
> > > that certain customers might prefer. I recall hearing this idea from
> > > Mathieu originally, though I=E2=80=99m not sure whether he plans to i=
mplement it.
> > >
> >
> > As Daniel pointed out, gpio-virtio is already available and already inc=
ludes a
> > protocol that is generic - no need to redefine a new one as this set is=
 trying to.
> >
> > As mentioned in a previous email, I understand some implementations wil=
l have
> > restricted memory and need to use RPMSG.  For those cases a generic rpm=
sg-gpio
>
> I think this highlights why some customers prefer RPMSG over using virtio=
 directly. Limited
> system resources and development efficiency are the two main reasons that=
 make RPMSG
> a better fit for certain environments.
>
> > protocol should be derived from gpio-virtio that would only deal with b=
reaking
> > down the standard gpio-virtio protocol into something digestible by RPM=
SG.  That
> > was Bjorn's point in an earlier message.  This will allow to use the sa=
me interface
> > and be flexible in how we want to talk to the transport medium, i.e pur=
e gpio-
> > virtio or rpmsg-gpio.
> >
>
> Once the remoteproc chooses to expose devices through an RPMSG=E2=80=91ba=
sed protocol,
> deriving another driver from gpio=E2=80=91virtio doesn=E2=80=99t really m=
ake sense. That would essentially
> mean re=E2=80=91implementing parts of RPMSG yourself instead of using exi=
sting one.
>

We clearly do not understand each other.

> > Fortunately RPMSG already uses channels to differentiate between traffi=
c, no
> > need to multiplex everything on the same channel.  That too needs to go=
.
> >
> > > As the chip vendor, NXP=E2=80=99s role is to provide all possible opt=
ions and
> > > let customers choose the approach that best fits their needs; we don=
=E2=80=99t make
> > that decision for them.
> >
> > As kernel maintainers, our role is to advise on designs that are generi=
c, simple,
> > maintainable and stand the test of time.
> >
>
> These adjectives only make sense within the context of a specific use cas=
e. Different
>  systems have different constraints, and people choose a particular solut=
ion for valid
> reasons based on their requirements.
>

You can choose whatever solution you want, that is entirely up to you.
Maintainers can also choose to reject that solution for mainline
Linux, which is exactly what we are doing.

> Please respect their efforts.
>
> Thanks,
> Shenwei
>
> > >
> > > Thanks,
> > > Shenwei
> > >
> > > >
> > > > If not, it would be good to derive a generic rpmsg-gpio protocol
> > > > from the virtio protocol, and land implementations of this in e.g.
> > > > Linux and Zephyr to establish that option.
> > > >
> > > > Regards,
> > > > Bjorn
> > > >
> > > > >
> > > > > In the end, I am just trying to influence the direction for RPMsg=
,
> > > > > but based on the discussions in this thread, it seems others shar=
e
> > > > > similar expectations, which should probably be taken into account=
 as well.
> > > > >
> > > > > Thanks and Regards,
> > > > > Arnaud
> > > > >
> > > > >
> > > > > I just want to
> > > > >
> > > > > >
> > > > > > Yours,
> > > > > > Linus Walleij
> > > > >

