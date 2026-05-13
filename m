Return-Path: <linux-gpio+bounces-36766-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4EDGHZevBGp6NAIAu9opvQ
	(envelope-from <linux-gpio+bounces-36766-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2026 19:06:31 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CD982537AC3
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2026 19:06:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8FD2231C942A
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2026 16:34:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D37694CA274;
	Wed, 13 May 2026 16:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bY1jAGQZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E89B54C9577
	for <linux-gpio@vger.kernel.org>; Wed, 13 May 2026 16:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778690081; cv=pass; b=hLUlFuDPHd5VDmdiHrhByA4CmQWzYbAR9rsopf5mECy/21xeKF5PUz1BCDwVcdakoGOzSuRxtgbMr26P/lY/gCZY5k+UaXfBfWS8sg6sAFgnQI1ufUnNMAicPnoWhNku7L9KlQCp/yI1dnCIRZk5cGIyBYXq9jpy7Fh/P+zJHWU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778690081; c=relaxed/simple;
	bh=TtwmYMgaXrKm/jFEPvbHl5SChSWNVEYdxlHKg/vAFfQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NHbpswO0Ke7fZRaKhVWafosIagA1k8ZrYif3YJGRzJfznsIaILuSog90Ov/+/jYSzg4QiKvsjsoSsrSpMlHTvnp84J2+cdr74kiuyJzaDUDYNwzfufwsINsuXrS2sJmeFD0xGeaZxbdARMPTOmW72emRJz+Tc2anDdd7jcX45yw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bY1jAGQZ; arc=pass smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-67cac5ece75so11373082a12.2
        for <linux-gpio@vger.kernel.org>; Wed, 13 May 2026 09:34:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778690076; cv=none;
        d=google.com; s=arc-20240605;
        b=DGdBk1UDn2qIzPOkuKaSfZ8FwLRkVApdU9spX8CWcTvWs8hH941nxY7D/6OB7s3d5Q
         e0ZqJ4W8xWv+jIrFhkQKZTYS+co/7kk+Ija9naiLigbHg7aSDcrI1jFaNynD1BP02EzH
         icf9GaXVQnh21AP1n2VaoypR+d/AAEDTz8b3dUg+aKf/GCZj4xT/QGwfGcfrUquJO3Fs
         kdA2qT+s+275sNWYPm4Uw9Fi6dXhgVuPgKeGrgmmU1JRIa4rultxrX41Ka7tCqhviXid
         1faW6bZM4Up7a1+nAE13xgqY9/EUBq1MNhP/mRU/AnXbNUxDc7shnRknM5x4ciPby3aY
         fCFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=O2vrQJJ/tAQxfPGzBUN6ljzsJ4iwh3MwwaLYpb/o5fI=;
        fh=BjLxiiJQTHaw21bcbmsOxdt6GJ0Qn2PmoIoSl/gBcyI=;
        b=E4pEavwqj4/iEpfBbPEZIcEvq+UDiudtnPQNzYUI0Knohlit5P6yc7Z2DKTIuFalav
         JKODn/p8pQbBv25ujB1tdx1upm/wbeYYhfmsQQmc4Ug1nXX4XYNTiM0Tdt7U0VJXC3uB
         DIQ8XMPnXcFFzC5zYF9katwGBcafLmhPfD9ugtaYyta9c7AQOWobzlK2jKClddN+4zM6
         6qbe58GJhRAks0sQu6yt03DOHUnXGJh5FHI0kp+M9v2yZ8P4v700pRb4FHaNPQHLzf3+
         RjY5OUAEvKhFLy1Rn81RzNA873gBX1S0YPSuFDzcPMYDxIkxTBaa4kSzmLuIh25GCl+Z
         x9dw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778690076; x=1779294876; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O2vrQJJ/tAQxfPGzBUN6ljzsJ4iwh3MwwaLYpb/o5fI=;
        b=bY1jAGQZ2EHTkdxCdgf01HgfDqqFH/Pqguhfxb8njrUM4PoB/aEmi7uL3pNGLOc+Em
         NC7B2FVo9hQcAikztfyWywxYI07fjyJmPkYJtM2hcaaeYlMnKKx9aUWIRIxUI05j7iII
         aiGOOdtzcWOkdo+iP3V7YJvT3W+zLhzigxKoEW2n6N2v6wB9X8tPwXQGNLvtTun/Apqu
         lskDpbkXeNpbgngX5JgVvdJMNUF41m3v1SHFZ0XwbBC8BEHwI9HHrRQXSb0JbMBT7hN4
         0QoDKF/1JzMDtOTigi/t+Yw+4wKwjsq6qGeQ3+T7qupeVV9UE262Jyu23GENUhPX2uW+
         tX/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778690076; x=1779294876;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=O2vrQJJ/tAQxfPGzBUN6ljzsJ4iwh3MwwaLYpb/o5fI=;
        b=g8z/zGj7Jf+EokiuyZ9P3eEmBc/u5k9ZOle4oXOXRpwrbOcGrlgpwxe/0n3YuZZtyK
         Jl7Y1xWTVCJNpTlsPeaV55n2qh8udnJc4LRuPbmSuW2862e4HUbuZ7wvQLJ+3hjuNOJg
         nb19txOQ5JshwY/R/BUPOi11D+nowCT/o55UwTlhITCovdR6GAlbvczFm0j2NsubtlK3
         hDg8xN5dpvKftIVjAgnFe4Iu3udNrLYLk1R7Cx8pal3kadNPZF1Ycs2xDjEd8K5h0ZEG
         x8JqF7KDjvo2iNhUJY+w5E4vO5xb/wbd/LngpkQJ3+5nBsnNMyO/MyYX/DUywJYnfYV+
         IgLQ==
X-Forwarded-Encrypted: i=1; AFNElJ/9gHZC9zErNNe6TDwjkoitNNT/uWu+jy8IaRTjQ7R/8WFT6zXeEZ6hRFKqFKumjxr4hZ5FZ+MpCMUr@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2qt83Fu1xUnSRUcINcsRqWGUN9wT+TXM2S3Cfeqw2K4LnC2lf
	NjbFDyb2/1CAkL2wMDadMLT4kNrcq+slBubAEmg9k9Syx668mRTs1w9bNov6KBYZPgfTdjypViP
	nEpZ7tWS9FkgmWOjwYdyIWyYzOI7EhPxhqXRp3g3psA==
X-Gm-Gg: Acq92OGesGdyC/zI/iP9BmZO7of22xrm5/P55CfJWP55YAEFrl2jHyCysqtpP2vOyha
	FUKWSfBmIyg/4u7lu5Wfb3Ds0CWA09AjtYx41FdNOQae8+INoM+G7yZAzGpJ7Hi3MNmtE40ETuA
	520FKaV8eQ6TjVCiEi6TL8mYwx7joP+NbEyT2zD4sV0G7JiLP677N4PZodU+Zq6hXObphPJSIqs
	1z91KJ9RwPxKsOWXBQJhh1hUpIhHgbTIh67CtQK3LzAPQ4LqIDLDcj4vpc+7FrXH44cHmwj0S6F
	Nx6rH6uQk/aoIGeRhrias/NzPSQVkqKGQtcxnagf8Q==
X-Received: by 2002:a05:6402:3112:b0:680:c7b7:25bf with SMTP id
 4fb4d7f45d1cf-682558f0800mr1771862a12.6.1778690076185; Wed, 13 May 2026
 09:34:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CANLsYkzt9xUczxSU28u-TfZAAjr0ufZKXAj8Eqfq=45gufXW3w@mail.gmail.com>
 <f7ef3417-eb84-4467-ac72-a9bc8b0c81e8@foss.st.com> <21de8440-adf7-454b-acfc-06e50882e075@ti.com>
 <4c526816-b127-43e7-86e9-eee4dc1152bc@foss.st.com> <c6f68ab5-271a-41ed-b285-75b739f1edd6@amd.com>
 <87850f70-5275-4393-941f-d01146a9cffc@foss.st.com> <da3b79b7-9dad-48cb-b552-cf6df445899f@amd.com>
 <08c815f5-ccbe-404a-95a1-a549aac8a55d@amd.com> <CANLsYkz8HpM_8eS7DjN_jmYs4T7P9xY0jYmdiAx5WO=_1zvFpQ@mail.gmail.com>
 <ae5cfa0f-e929-4abb-b27b-8eb27586d183@amd.com> <agNKHsAEscc1TDiq@p14s> <13140ca1-b4bc-4acc-9f7c-d23490e56dbb@amd.com>
In-Reply-To: <13140ca1-b4bc-4acc-9f7c-d23490e56dbb@amd.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Wed, 13 May 2026 10:34:23 -0600
X-Gm-Features: AVHnY4LlL7Ttn0kyLcAEI25wPPbnshkIgGcqf1PBJs6sXkh3goBpnufJocwDTiY
Message-ID: <CANLsYkz9-+1o4ek0f5jS=-G1nPpp7BkCmNE5cin1zRY_e6Me-A@mail.gmail.com>
Subject: Re: [PATCH v13 3/4] gpio: rpmsg: add generic rpmsg GPIO driver
To: tanmay.shah@amd.com
Cc: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>, Beleswar Prasad Padhi <b-padhi@ti.com>, 
	Shenwei Wang <shenwei.wang@nxp.com>, Andrew Lunn <andrew@lunn.ch>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Frank Li <frank.li@nxp.com>, 
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
X-Rspamd-Queue-Id: CD982537AC3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36766-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_CC(0.00)[foss.st.com,ti.com,nxp.com,lunn.ch,kernel.org,lwn.net,pengutronix.de,linuxfoundation.org,vger.kernel.org,gmail.com,lists.linux.dev,lists.infradead.org,bgdev.pl];
	RCPT_COUNT_TWELVE(0.00)[27];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mathieu.poirier@linaro.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Tue, 12 May 2026 at 11:20, Shah, Tanmay <tanmays@amd.com> wrote:
>
>
>
> On 5/12/2026 10:41 AM, Mathieu Poirier wrote:
> > On Mon, May 11, 2026 at 04:35:46PM -0500, Shah, Tanmay wrote:
> >>
> >>
> >> On 5/11/2026 12:58 PM, Mathieu Poirier wrote:
> >>> On Mon, 11 May 2026 at 10:47, Shah, Tanmay <tanmays@amd.com> wrote:
> >>>>
> >>>>
> >>>>
> >>>> On 5/5/2026 10:52 AM, Shah, Tanmay wrote:
> >>>>>
> >>>>>
> >>>>> On 5/5/2026 4:28 AM, Arnaud POULIQUEN wrote:
> >>>>>> Hi Tanmay,
> >>>>>>
> >>>>>> On 5/4/26 21:19, Shah, Tanmay wrote:
> >>>>>>>
> >>>>>>> Hello all,
> >>>>>>>
> >>>>>>> I have started reviewing this work as well.
> >>>>>>> Thanks Shenwei for this work.
> >>>>>>>
> >>>>>>> I have gone through only the current revision, and would like to =
provide
> >>>>>>> idea on how to achieve GPIO number multiplexing with the RPMsg pr=
otocol.
> >>>>>>> Also, have some bindings related question.
> >>>>>>>
> >>>>>>> Please see below:
> >>>>>>>
> >>>>>>> On 4/30/2026 11:40 AM, Arnaud POULIQUEN wrote:
> >>>>>>>>
> >>>>>>>>
> >>>>>>>> On 4/30/26 14:56, Beleswar Prasad Padhi wrote:
> >>>>>>>>> Hello Arnaud,
> >>>>>>>>>
> >>>>>>>>> On 30/04/26 13:05, Arnaud POULIQUEN wrote:
> >>>>>>>>>> Hello,
> >>>>>>>>>>
> >>>>>>>>>> On 4/29/26 21:20, Mathieu Poirier wrote:
> >>>>>>>>>>> On Wed, 29 Apr 2026 at 12:07, Padhi, Beleswar <b-padhi@ti.com=
> wrote:
> >>>>>>>>>>>>
> >>>>>>>>>>>> Hi Mathieu,
> >>>>>>>>>>>>
> >>>>>>>>>>>> On 4/29/2026 11:03 PM, Mathieu Poirier wrote:
> >>>>>>>>>>>>> On Wed, 29 Apr 2026 at 10:53, Shenwei Wang <shenwei.wang@nx=
p.com>
> >>>>>>>>>>>>> wrote:
> >>>>>>>>>>>>>>
> >>>>>>>>>>>>>>
> >>>>>>>>>>>>>>> -----Original Message-----
> >>>>>>>>>>>>>>> From: Mathieu Poirier <mathieu.poirier@linaro.org>
> >>>>>>>>>>>>>>> Sent: Wednesday, April 29, 2026 10:42 AM
> >>>>>>>>>>>>>>> To: Shenwei Wang <shenwei.wang@nxp.com>
> >>>>>>>>>>>>>>> Cc: Andrew Lunn <andrew@lunn.ch>; Padhi, Beleswar <b-
> >>>>>>>>>>>>>>> padhi@ti.com>; Linus
> >>>>>>>>>>>>>>> Walleij <linusw@kernel.org>; Bartosz Golaszewski
> >>>>>>>>>>>>>>> <brgl@kernel.org>; Jonathan
> >>>>>>>>>>>>>>> Corbet <corbet@lwn.net>; Rob Herring <robh@kernel.org>;
> >>>>>>>>>>>>>>> Krzysztof Kozlowski
> >>>>>>>>>>>>>>> <krzk+dt@kernel.org>; Conor Dooley <conor+dt@kernel.org>;=
 Bjorn
> >>>>>>>>>>>>>>> Andersson
> >>>>>>>>>>>>>>> <andersson@kernel.org>; Frank Li <frank.li@nxp.com>; Sasc=
ha Hauer
> >>>>>>>>>>>>>>> <s.hauer@pengutronix.de>; Shuah Khan
> >>>>>>>>>>>>>>> <skhan@linuxfoundation.org>; linux-
> >>>>>>>>>>>>>>> gpio@vger.kernel.org; linux-doc@vger.kernel.org; linux-
> >>>>>>>>>>>>>>> kernel@vger.kernel.org;
> >>>>>>>>>>>>>>> Pengutronix Kernel Team <kernel@pengutronix.de>; Fabio Es=
tevam
> >>>>>>>>>>>>>>> <festevam@gmail.com>; Peng Fan <peng.fan@nxp.com>;
> >>>>>>>>>>>>>>> devicetree@vger.kernel.org; linux-remoteproc@vger.kernel.=
org;
> >>>>>>>>>>>>>>> imx@lists.linux.dev; linux-arm-kernel@lists.infradead.org=
; dl-
> >>>>>>>>>>>>>>> linux-imx <linux-
> >>>>>>>>>>>>>>> imx@nxp.com>; Bartosz Golaszewski <brgl@bgdev.pl>
> >>>>>>>>>>>>>>> Subject: [EXT] Re: [PATCH v13 3/4] gpio: rpmsg: add gener=
ic
> >>>>>>>>>>>>>>> rpmsg GPIO driver
> >>>>>>>>>>>>>>> On Tue, Apr 28, 2026 at 03:24:59PM +0000, Shenwei Wang wr=
ote:
> >>>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>>>> -----Original Message-----
> >>>>>>>>>>>>>>>>> From: Andrew Lunn <andrew@lunn.ch>
> >>>>>>>>>>>>>>>>> Sent: Monday, April 27, 2026 3:49 PM
> >>>>>>>>>>>>>>>>> To: Shenwei Wang <shenwei.wang@nxp.com>
> >>>>>>>>>>>>>>>>> Cc: Padhi, Beleswar <b-padhi@ti.com>; Linus Walleij
> >>>>>>>>>>>>>>>>> <linusw@kernel.org>; Bartosz Golaszewski <brgl@kernel.o=
rg>;
> >>>>>>>>>>>>>>>>> Jonathan
> >>>>>>>>>>>>>>>>> Corbet <corbet@lwn.net>; Rob Herring <robh@kernel.org>;
> >>>>>>>>>>>>>>>>> Krzysztof
> >>>>>>>>>>>>>>>>> Kozlowski <krzk+dt@kernel.org>; Conor Dooley
> >>>>>>>>>>>>>>>>> <conor+dt@kernel.org>;
> >>>>>>>>>>>>>>>>> Bjorn Andersson <andersson@kernel.org>; Mathieu Poirier
> >>>>>>>>>>>>>>>>> <mathieu.poirier@linaro.org>; Frank Li <frank.li@nxp.co=
m>;
> >>>>>>>>>>>>>>>>> Sascha
> >>>>>>>>>>>>>>>>> Hauer <s.hauer@pengutronix.de>; Shuah Khan
> >>>>>>>>>>>>>>>>> <skhan@linuxfoundation.org>; linux-gpio@vger.kernel.org=
; linux-
> >>>>>>>>>>>>>>>>> doc@vger.kernel.org; linux-kernel@vger.kernel.org; Peng=
utronix
> >>>>>>>>>>>>>>>>> Kernel Team <kernel@pengutronix.de>; Fabio Estevam
> >>>>>>>>>>>>>>>>> <festevam@gmail.com>; Peng Fan <peng.fan@nxp.com>;
> >>>>>>>>>>>>>>>>> devicetree@vger.kernel.org; linux- remoteproc@vger.kern=
el.org;
> >>>>>>>>>>>>>>>>> imx@lists.linux.dev; linux-arm- kernel@lists.infradead.=
org;
> >>>>>>>>>>>>>>>>> dl-linux-imx <linux-imx@nxp.com>; Bartosz Golaszewski
> >>>>>>>>>>>>>>>>> <brgl@bgdev.pl>
> >>>>>>>>>>>>>>>>> Subject: [EXT] Re: [PATCH v13 3/4] gpio: rpmsg: add gen=
eric
> >>>>>>>>>>>>>>>>> rpmsg
> >>>>>>>>>>>>>>>>> GPIO driver
> >>>>>>>>>>>>>>>>>>> struct virtio_gpio_response {
> >>>>>>>>>>>>>>>>>>>             __u8 status;
> >>>>>>>>>>>>>>>>>>>             __u8 value;
> >>>>>>>>>>>>>>>>>>> };
> >>>>>>>>>>>>>>>>>> It is the same message format. Please see the message
> >>>>>>>>>>>>>>>>>> definition
> >>>>>>>>>>>>>>>>> (GET_DIRECTION) below:
> >>>>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>>>>> +   +-----+-----+-----+-----+-----+----+
> >>>>>>>>>>>>>>>>>> +   |0x00 |0x01 |0x02 |0x03 |0x04 |0x05|
> >>>>>>>>>>>>>>>>>> +   | 1   | 2   |port |line | err | dir|
> >>>>>>>>>>>>>>>>>> +   +-----+-----+-----+-----+-----+----+
> >>>>>>>>>>>>>>>>> Sorry, but i don't see how two u8 vs six u8 are the sam=
e
> >>>>>>>>>>>>>>>>> message format.
> >>>>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>>> Some changes to the message format are necessary.
> >>>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>>> Virtio uses two communication channels (virtqueues): one=
 for
> >>>>>>>>>>>>>>>> requests and
> >>>>>>>>>>>>>>> replies, and a second one for events.
> >>>>>>>>>>>>>>>> In contrast, rpmsg provides only a single communication
> >>>>>>>>>>>>>>>> channel, so a
> >>>>>>>>>>>>>>>> type field is required to distinguish between different =
kinds
> >>>>>>>>>>>>>>>> of messages.
> >>>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>>> Since rpmsg replies and events share the same message fo=
rmat,
> >>>>>>>>>>>>>>>> an additional
> >>>>>>>>>>>>>>> line is introduced to handle both cases.
> >>>>>>>>>>>>>>>> Finally, rpmsg supports multiple GPIO controllers, so a =
port
> >>>>>>>>>>>>>>>> field is added to
> >>>>>>>>>>>>>>> uniquely identify the target controller.
> >>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>> I have commented on this before - RPMSG is already provid=
ing
> >>>>>>>>>>>>>>> multiplexing
> >>>>>>>>>>>>>>> capability by way of endpoints.  There is no need for a p=
ort
> >>>>>>>>>>>>>>> field.  One endpoint,
> >>>>>>>>>>>>>>> one GPIO controller.
> >>>>>>>>>>>>>>>
> >>>>>>>>>>>>>> You still need a way to let the remote side know which por=
t the
> >>>>>>>>>>>>>> endpoint maps to, either
> >>>>>>>>>>>>>> by embedding the port information in the message (the curr=
ent
> >>>>>>>>>>>>>> way), or by sending it
> >>>>>>>>>>>>>> separately.
> >>>>>>>>>>>>>>
> >>>>>>>>>>>>> An endpoint is created with every namespace request.  There
> >>>>>>>>>>>>> should be
> >>>>>>>>>>>>> one namespace request for every GPIO controller, which yiel=
ds a
> >>>>>>>>>>>>> unique
> >>>>>>>>>>>>> endpoint for each controller and eliminates the need for an=
 extra
> >>>>>>>>>>>>> field to identify them.
> >>>>>>>>>>>>
> >>>>>>>>>>>>
> >>>>>>>>>>>> Right, but this can still be done by just having one namespa=
ce
> >>>>>>>>>>>> request.
> >>>>>>>>>>>> We can create new endpoints bound to an existing namespace/
> >>>>>>>>>>>> channel by
> >>>>>>>>>>>> invoking rpmsg_create_ept(). This is what I suggested here t=
oo:
> >>>>>>>>>>>> https://lore.kernel.org/all/29485742-6e49-482e-
> >>>>>>>>>>>> b73d-228295daaeec@ti.com/
> >>>>>>>>>>>>
> >>>>>>>>>>>
> >>>>>>>>>>> I will look at your suggestion (i.e link above) later this we=
ek or
> >>>>>>>>>>> next week.
> >>>>>>>>>>>
> >>>>>>>>>>>> My mental model looks like this for the complete picture:
> >>>>>>>>>>>>
> >>>>>>>>>>>> 1. namespace/channel#1 =3D rpmsg-io
> >>>>>>>>>>>>        a. ept1 -> gpio-controller@1
> >>>>>>>>>>>>        b. ept2 -> gpio-controller@2
> >>>>>>>>>>>>
> >>>>>>>
> >>>>>>> If my understanding of what gpio-controller is right, than this w=
on't
> >>>>>>> work. We need one rpmsg channel per gpio-controller, and in most =
cases
> >>>>>>> there will be only one GPIO-controller on the remote side. If the=
re are
> >>>>>>> multiple or multiple instances of same controller, than we need s=
eparate
> >>>>>>> channel name for that controller just like we would have separate=
 device
> >>>>>>> on the Linux.
> >>>>>>
> >>>>>> As done in ehe rpmsg_tty driver it could be instantiated several t=
imes with
> >>>>>> the same channel/service name. This would imply a specific rpmsg t=
o
> >>>>>> retreive
> >>>>>> the gpio controller index from the remote side.
> >>>>>>>
> >>>>>>>>>>>
> >>>>>>>>>>> I've asked for one endpoint per GPIO controller since the ver=
y
> >>>>>>>>>>> beginning.  I don't yet have a strong opinion on whether to u=
se one
> >>>>>>>>>>> namespace request per GPIO controller or a single request tha=
t spins
> >>>>>>>>>>> off multiple endpoints.  I'll have to look at your link and
> >>>>>>>>>>> reflect on
> >>>>>>>>>>> that.  Regardless of how we proceed on that front, multiplexi=
ng needs
> >>>>>>>>>>> to happen at the endpoint level rather than the packet level.
> >>>>>>>>>>> This is
> >>>>>>>>>>> the only way this work can move forward.
> >>>>>>>>>>>
> >>>>>>>>>>
> >>>>>>>>>> I would be more in favor of Mathieu=E2=80=99s proposal: =E2=80=
=9CAn endpoint is
> >>>>>>>>>> created with every namespace request.=E2=80=9D
> >>>>>>>>>>
> >>>>>>>>>> If the endpoint is created only on the Linux side, how do we m=
atch
> >>>>>>>>>> the Linux endpoint address with the local port field on the re=
mote
> >>>>>>>>>> side?
> >>>>>>>>>
> >>>>>>>>>
> >>>>>>>>> Simply by sending a message to the remote containing the newly =
created
> >>>>>>>>> endpoint and the port idx. Note that is this done just one time=
, after
> >>>>>>>>> this
> >>>>>>>>> Linux need not have the port field in the message everytime its=
 sending
> >>>>>>>>> a message.
> >>>>>>>>>
> >>>>>>>>>>
> >>>>>>>>>> With a multi-namespace approach, the namespace could be rpmsg-=
io-
> >>>>>>>>>> [addr], where [addr] corresponds to the GPIO controller addres=
s in
> >>>>>>>>>> the DT. This would:
> >>>>>>>>>
> >>>>>>>>>
> >>>>>>>>> You will face the same problem in this case also that you asked=
 above:
> >>>>>>>>> "how do we match the Linux endpoint address with the local port=
 field
> >>>>>>>>> on the remote side?"
> >>>>>>>>
> >>>>>>>> Sorry I probably introduced confusion here
> >>>>>>>> my sentence should be;
> >>>>>>>>   With a multi-namespace approach, the namespace could be rpmsg-=
io-
> >>>>>>>> [port],
> >>>>>>>>   where [port] corresponds to the GPIO controller port in the DT=
.
> >>>>>>>>
> >>>>>>>>
> >>>>>>>> For instance:
> >>>>>>>>
> >>>>>>>>        rpmsg {
> >>>>>>>>          rpmsg-io {
> >>>>>>>>            #address-cells =3D <1>;
> >>>>>>>>            #size-cells =3D <0>;
> >>>>>>>>
> >>>>>>>>            gpio@25 {
> >>>>>>>>              compatible =3D "rpmsg-gpio";
> >>>>>>>>              reg =3D <25>;
> >>>>>>>>              gpio-controller;
> >>>>>>>>              #gpio-cells =3D <2>;
> >>>>>>>>              #interrupt-cells =3D <2>;
> >>>>>>>>              interrupt-controller;
> >>>>>>>>            };
> >>>>>>>>
> >>>>>>>>            gpio@32 {
> >>>>>>>>              compatible =3D "rpmsg-gpio";
> >>>>>>>>              reg =3D <32>;
> >>>>>>>>              gpio-controller;
> >>>>>>>>              #gpio-cells =3D <2>;
> >>>>>>>>              #interrupt-cells =3D <2>;
> >>>>>>>>              interrupt-controller;
> >>>>>>>>            };
> >>>>>>>>          };
> >>>>>>>>        };
> >>>>>>>>
> >>>>>>>>   rpmsg-io-25  would match with gpio@25
> >>>>>>>>   rpmsg-io-32  would match with gpio@32
> >>>>>>>>
> >>>>>>>
> >>>>>>> The problem with this approach is, we will endup creating way too=
 many
> >>>>>>> RPMsg devices/channels. i.e. one channel per one GPIO. That limit=
s how
> >>>>>>> many GPIOs can be handled by remote from memory perspective. At
> >>>>>>> somepoint we might just run-out of number ept & channels created =
by the
> >>>>>>> remote. As of now, open-amp library supports 128 epts I think.
> >>>>>>
> >>>>>> Right, I proposed a solution in my previous answer to Beleswar who=
 has
> >>>>>> the same concern.
> >>>>>>
> >>>>>>>
> >>>>>>>>
> >>>>>>>>>
> >>>>>>>>> Because the endpoint that is created on a namespace request is =
also
> >>>>>>>>> dynamic in nature. How will the remote know which endpoint addr
> >>>>>>>>> Linux allocated for a namespace that it announced?
> >>>>>>>>>
> >>>>>>>>> As an example/PoC, I created a firmware example which announces
> >>>>>>>>> 2 name services to Linux, one is the standard "rpmsg_chrdev" an=
d
> >>>>>>>>> the other is a TI specific name service "ti.ipc4.ping-pong". Yo=
u can
> >>>>>>>>> see it created 2 different addresses (0x400 and 0x401) for each=
 of
> >>>>>>>>> the name service request from the same firmware:
> >>>>>>>>>
> >>>>>>>>> root@j784s4-evm:~# dmesg | grep virtio0 | grep -i channel
> >>>>>>>>> [    9.290275] virtio_rpmsg_bus virtio0: creating channel
> >>>>>>>>> ti.ipc4.ping-pong addr 0xd
> >>>>>>>>> [    9.311230] virtio_rpmsg_bus virtio0: creating channel rpmsg=
_chrdev
> >>>>>>>>> addr 0xe
> >>>>>>>>> [    9.496645] rpmsg_chrdev virtio0.rpmsg_chrdev.-1.14: DEBUG: =
Channel
> >>>>>>>>> formed from src =3D 0x400 to dst =3D 0xe
> >>>>>>>>> [    9.707255] rpmsg_client_sample virtio0.ti.ipc4.ping-pong.-1=
.13:
> >>>>>>>>> new channel: 0x401 -> 0xd!
> >>>>>>>>>
> >>>>>>>>> So in this case, rpmsg-io-1 can have different ept addr than rp=
msg-io-2
> >>>>>>>>> Back to same problem. Simple solution is to reply to remote wit=
h the
> >>>>>>>>> created ept addr and the index.
> >>>>>>>>
> >>>>>>>> That why I would like to suggest to use the name service field t=
o
> >>>>>>>> identify the port/controller, instead of the endpoint address.
> >>>>>>>>>
> >>>>>>>>>>
> >>>>>>>>>> - match the RPMsg probe with the DT,
> >>>>>>>>>
> >>>>>>>>>
> >>>>>>>>> We can probe from all controllers with a single name service
> >>>>>>>>> announcement too.
> >>>>>>>>>
> >>>>>>>>>> - provide a simple mapping between the port and the endpoint o=
n both
> >>>>>>>>>> sides,
> >>>>>>>>>
> >>>>>>>>>
> >>>>>>>>> We are trying to get rid of this mapping from Linux side to ada=
pt
> >>>>>>>>> the gpio-virtio design.
> >>>>>>>>>
> >>>>>>>>>> - allow multiple endpoints on the remote side,
> >>>>>>>>>
> >>>>>>>>>
> >>>>>>>>> We can support this as well with single nameservice model.
> >>>>>>>>> There is no limitation. Remote has to send a message with
> >>>>>>>>> its newly created ept that's all.
> >>>>>>>>>
> >>>>>>>>>> - provide a simple discovery mechanism for remote capabilities=
.
> >>>>>>>>>
> >>>>>>>>>
> >>>>>>>>> A single announcement: "rpmsg-io" is also discovery mechanism.
> >>>>>>>>>
> >>>>>>>>> Feel free to let me know if you have concerns with any of the
> >>>>>>>>> suggestions!
> >>>>>>>>
> >>>>>>>> My only concern, whatever the solution, is that we find a smart
> >>>>>>>> solution to associate the correct endpoint with the correct GPIO
> >>>>>>>> port/controller defined in the DT.
> >>>>>>>>
> >>>>>>>> I may have misunderstood your solution. Could you please help me
> >>>>>>>> understand your proposal by explaining how you would handle thre=
e
> >>>>>>>> GPIO ports defined in the DT, considering that the endpoint
> >>>>>>>> addresses on the Linux side can be random?
> >>>>>>>> If I assume there is a unique endpoint on the remote side,
> >>>>>>>> I do not understand how you can match, on the firmware side,
> >>>>>>>> the Linux endpoint address to the GPIO port.
> >>>>>>>>
> >>>>>>>> Thanks and Regards,Arnaud
> >>>>>>>>
> >>>>>>>>>
> >>>>>>>>> Thanks,
> >>>>>>>>> Beleswar
> >>>>>>>>>
> >>>>>>>>>>
> >>>>>>>>>> Regards,
> >>>>>>>>>> Arnaud
> >>>>>>>>>>
> >>>>>>>>>>>> 2. namespace/channel#2 =3D rpmsg-i2c
> >>>>>>>>>>>>        a. ept1 -> i2c@1
> >>>>>>>>>>>>        b. ept2 -> i2c@2
> >>>>>>>>>>>>        c. ept3 -> i2c@3
> >>>>>>>>>>>>
> >>>>>>>>>>>> etc...
> >>>>>>>>>>>>
> >>>>>>>
> >>>>>>> Just want to clear-up few terms before I jump to the solution:
> >>>>>>>
> >>>>>>> **RPMsg channel/device**:
> >>>>>>>    - These are devices announced by the remote processor, and cre=
ated by
> >>>>>>> linux. They are created at: /sys/bus/rpmsg/devices
> >>>>>>>    - The channel format: <name>.<src ept>.<dst ept>
> >>>>>>>
> >>>>>>> **RPMsg endpoint**:
> >>>>>>>    - Endpoint is differnt than channel. Single channel can have m=
ultiple
> >>>>>>> endpoints, and represented in the linux with: /dev/rpmsg? devices=
.
> >>>>>>>
> >>>>>>> To create endpoint device, we have rpmsg_create_ept API, which ta=
kes
> >>>>>>> channel information as input, which has src-ept, dst-ept.
> >>>>>>>
> >>>>>>> Following is proposed solution:
> >>>>>>>
> >>>>>>> 1) Assign RPMsg channel/device per rpmsg-gpio controller (Not per=
 GPIO
> >>>>>>> pin/port).
> >>>>>>>    - In our case that would be, single rpmsg-io node. (That makes=
 me
> >>>>>>> question if bindings are correct or not).
> >>>>>>>
> >>>>>>> 2) Assign GPIO number as src ept.
> >>>>>>>
> >>>>>>> i.e. *rpmsg-io.<GPIO number>.<dst ept>*. Do not randomly assign s=
rc
> >>>>>>> endpoint.
> >>>>>>>
> >>>>>>> Now, RPMSG channel by spec reserves first 1024 endpoints [1], so =
we can
> >>>>>>> add 1024 offset to the GPIO number:
> >>>>>>>
> >>>>>>> so, when calling rpmsg_create_ept() API, we assing src_endpoint a=
s:
> >>>>>>> (GPIO_NUMBER + RPMSG_RESERVED_ADDRESSES)
> >>>>>>>
> >>>>>>> Now on the remote side, there is single channel and only single-e=
ndpoint
> >>>>>>> is needed that is mapped to the rpmsg-io channel callback.
> >>>>>>>
> >>>>>>> That callback will receive all the payloads from the Linux, which=
 will
> >>>>>>> have src-ept i.e. (RPMSG_RESERVED_ADDRESSES + GPIO_NUMBER).
> >>>>>>
> >>>>>>
> >>>>>> Interesting approach. I also tried to find a similar solution.
> >>>>>>
> >>>>>> The question here is: how can we guarantee continuous addresses? G=
iven
> >>>>>> the static and dynamic allocation of endpoint addresses that are
> >>>>>> implemented, my conclusion was that it is not reliable enough.
> >>>>>>
> >>>>>> but perhaps I missed something...
> >>>>>>
> >>>>>>>
> >>>>>>> It can retrieve GPIO_NUMBER easily, and convert to appropriate pi=
n based
> >>>>>>> on platform specific logic.
> >>>>>>>
> >>>>>>> This doesn't need PORT information at all. Also it makes sure tha=
t
> >>>>>>> remote is using only single-endpoint so not much memory is used.
> >>>>>>>
> >>>>>>> *Example*:
> >>>>>>> If only rpmsg-gpio channel is created by the remote side, than fo=
llowing
> >>>>>>> is the representation of the devices when GPIO 25, 26, 27 is assi=
gned to
> >>>>>>> the rpmsg-io controller:
> >>>>>>>
> >>>>>>> Linux                                                      Remote
> >>>>>>>
> >>>>>>> rpmsg-channel: rpmsg-gpio.0x400.0x400
> >>>>>>>
> >>>>>>> /dev/rpmsg0 - GPIO25 ept (rpmsg-gpio.0x419.0x400)-|
> >>>>>>>                                                    |
> >>>>>>> /dev/rpmsg1 - GPIO26 ept (rpmsg-gpio.0x41a.0x400)-|-> rpmsg-gpio.=
*.0x400
> >>>>>>>                                                    |
> >>>>>>> /dev/rpmsg2 - GPIO27 ept (rpmsg-gpio.0x41b.0x400)-|  0x400 ept ca=
llback.
> >>>>>>>
> >>>>>>>
> >>>>>>> *On remote side*:
> >>>>>>>
> >>>>>>> ept_0x400_callback(..., int src_ept, ...,)
> >>>>>>> {
> >>>>>>>     int gpio_num =3D src_ept - RPMSG_RESERVED_ADDRESSES;
> >>>>>>>     // platform specific logic to convert gpio num to proper pin,
> >>>>>>>     // just like you would convert gpio num to pin on a linux gpi=
o
> >>>>>>> controller.
> >>>>>>> }
> >>>>>>>
> >>>>>>> My question on the binding:
> >>>>>>>
> >>>>>>> Why each GPIO is represented with the separate node? I think rpms=
g-gpio
> >>>>>>> can be represented just any other GPIO controller? Please let me =
know if
> >>>>>>> I am missing something. So rpmsg channel/rpmsg device is not crea=
ted per
> >>>>>>> GPIO, but per controller. GPIO number multiplexing should be done=
 with
> >>>>>>> rpmsg src ept, that removes the need of having each GPIO as a sep=
arate
> >>>>>>> node.
> >>>>>>>
> >>>>>>>
> >>>>>>> rpmsg_gpio: rpmsg-gpio@0 {
> >>>>>>>         compatible =3D "rpmsg-gpio";
> >>>>>>>         reg =3D <0>;
> >>>>>>>         gpio-controller;
> >>>>>>>         #gpio-cells =3D <2>;
> >>>>>>>         #interrupt-cells =3D <2>;
> >>>>>>>         interrupt-controller;
> >>>>>>>     };
> >>>>>>>
> >>>>>>> Then in DT, use like regular GPIO, but with the rpmsg-gpio contro=
ller:
> >>>>>>>
> >>>>>>> rpmsg-gpios =3D <&rpmsg_gpio (GPIO NUM) (flags)>;
> >>>>>>>
> >>>>>>> If the intent to create separate gpio nodes was only for the chan=
nel
> >>>>>>> creation, then it's not really needed.
> >>>>>>>
> >>>>>>> [1]
> >>>>>>> https://github.com/torvalds/linux/
> >>>>>>> blob/6d35786de28116ecf78797a62b84e6bf3c45aa5a/drivers/rpmsg/
> >>>>>>> virtio_rpmsg_bus.c#L136
> >>>>>>>
> >>>>>>
> >>>>>> It is already the case. bindings declare GPIO controllers, not dir=
ectly
> >>>>>> GPIOs in:
> >>>>>>
> >>>>>> [PATCH v13 2/4] dt-bindings: remoteproc: imx_rproc: Add "rpmsg" su=
bnode
> >>>>>> support
> >>>>>>
> >>>>>> The discussion is around having an unique RPmsg endpoint for all
> >>>>>> GPIO controller or one RPmsg endpoint per GPIO controller.
> >>>>>>
> >>>>>
> >>>>> Endpoint where remote side or linux side?
> >>>>>
> >>>>> If unique endpoint on remote side per gpio controller then it makes=
 sense.
> >>>>>
> >>>>> Unique endpoint on linux side doesn't make sense. Instead, unique
> >>>>> channel per gpio controller makes sense, and each channel will have
> >>>>> multiple endpoints on linux side. As I replied to Beleswar on the o=
ther
> >>>>> email, I will copy past my answer here too:
> >>>>>
> >>>>>
> >>>>> To be more specific:
> >>>>>
> >>>>> Linux:                               remote:
> >>>>>
> >>>>> ch1: rpmsg-gpio.-1.1024 ->     gpio-controller@1024
> >>>>>     - gpio-line ept1
> >>>>>     - gpio-line ept2    ->     They all map to same callback_ept_10=
24.
> >>>>>     - gpio-line ept3
> >>>>>
> >>>>> ch2: rpmsg-gpio.-1.1025 ->     gpio-controller@1025
> >>>>>     - gpio-line ept1
> >>>>>     - gpio-line ept2    ->     They all map to same callback_ept_10=
25.
> >>>>>     - gpio-line ept3
> >>>>>
> >>>>
> >>>>
> >>>> Hi Mathieu,
> >>>>
> >>>> So upon more brain storming in this approach I found limitation:
> >>>>
> >>>> This approach won't work if host OS is any other OS but Linux. For
> >>>> example, if the remote OS is zephyr/baremetal using open-amp, then O=
nly
> >>>> Linux <-> zephyr combination will work, and we won't be able to re-u=
se
> >>>> this approach for zephyr <-> zephyr use case. The concept of rpmsg
> >>>> channel/device exist only in the linux kernel implementation. This
> >>>> brings another question: Should the protocol we decide work on other=
 use
> >>>> cases as well? Or Linux must be the Host OS for this protocol ?
> >>>>
> >>>
> >>> Linux and Zephyr are very distinct OS, each with their own subsystems
> >>> and characteristics.  The design we choose here involves RPMSG and,
> >>> inherently, Linux.  We can't make decisions based on what may
> >>> potentially happen in Zephyr.
> >>>
> >>>>
> >>>> I think your & Arnaud's proposed approach of single endpoint per
> >>>> gpio-controller on both side makes more sense, as it will work
> >>>> regardless of any OS on host or remote side.
> >>>>
> >>>
> >>> Arnaud, Beleswar, Andrew and I are all advocating for one endpoint pe=
r
> >>> GPIO controller.  The remaining issue it about the best way to work
> >>> out source and destination addresses between Linux and the remote
> >>> processor.  I'm running out of time for today but I'll return to this
> >>> thread with a final analysis by the end of the week.
> >>>
> >>
> >> Okay. Then that means multiple endpoints on Linux side can be consider=
ed.
> >
> > If there are multiple GPIO controllers then yes, there will be more tha=
n one
> > endpoint.  At this time I do now want to condiser other bus architectur=
es (i2c,
> > spi, ...) to avoid muddying an already difficult conversation.
> >
> >>
> >> If we decide to go single-endpoint per device on both side, then for
> >> that here is the proposal to represent src ept and dst ept:
> >
> > I do not understand what you mean by "per device" - please be more spec=
ific.
> >
>
> "per device" I mean, per rpmsg device/channel. In our case that would be
> per gpio-controller.
>
> >>
> >> When we represent any device under rpmsg bus node, I think it should b=
e
> >> considered remote's view of the adddress space. So ideally we can
> >> convert it to Linux view of the address space, via 'ranges' property.
> >
> > There is no address space to consider since there is no GPIO controller=
 memory
> > space to access.  All that is done by the driver (remote processor) and
> > completely hidden from Linux by rpmsg-virtio-gpio.
> >
>
> So IMHO the dt-binding is the representation of the device hardware and
> is independent of how driver will access it. Any gpio-controller device
> node, we are just representing how gpio-controller hardware on the
> remote side looks like, and what is the corresponding view of the linux i=
s.
>
> The rpmsg-gpio driver is different than the platform gpio controller
> driver mainly in two ways:
>
> 1) How the driver is probed: rpmsg-gpio driver will be probed when
> corresponding rpmsg channel/device name-service announcment will happen
> from the remote side.
>

I agree.

> 2) The GPIO Ops are not performed on the hardware directly, but it's
> done via rpmsg commands on the remote side.
>

I agree.

> However, the GPIO controller hardware remains the same. So bindings
> shoudln't change.
>

That is where I have a different point of view.  There is no need to
have information in the bindings the kernel won't use.  We are
advertizing virtio-gpio devices and as such should use virtio-gpio
bindings.  The only thing that changes is the transport method, i.e,
encapsulated in RPMSG rather than directly over virtqueues.

> IMHO That means, if I want to move any existing GPIO-controller to the
> remote side, and want the rpmsg-gpio driver to handle it then, all I
> need to change is the compatible string of the current gpio-controller
> device node. The rest of the address space should remain the same, and
> leave ranges property empty. If the remote core has different view of
> the address space, then the device should contain remote's view and
> parent bus (rpmsg-io bus) should provide linux view via 'ranges' property=
.
>
> That is just the device hw representation in the device-tree as rpmsg
> device. Same for any other type of the controller: i2c, spi etc.
>
> Thanks,
> Tanmay
>
>
> >>
> >> So bindings should include 'ranges' property in the parent node. Then
> >> linux view of the start address becomes src ept, and remote view of th=
e
> >> start address becomes dest ept. The remote view of the start address i=
s
> >> expected to be the static src endpoint on the remote side.
> >>
> >> Following representation of the rpmsg devices (gpio, i2c, spi or any o=
ther):
> >>
> >> rpmsg {
> >>   #address-cells =3D <1>;
> >>   #size-cells =3D <1>;
> >>
> >>   rpmsg-io {
> >>     compatible =3D "rpmsg-io-bus";
> >>     ranges =3D <remote_view_addr(dst ept) linux_view_addr(src ept) siz=
e>;
> >>     #address-cells =3D <1>;
> >>     #size-cells =3D <1>;
> >>
> >>     gpio@remote_view_addr(or dst ept) {
> >>       compatible =3D "rpmsg-io";
> >>       reg =3D <remote_view_addr addr_space_size>;
> >>       gpio-controller;
> >>       #gpio-cells =3D <2>;
> >>       interrupt-controller;
> >>       #interrupt-cells =3D <2>;
> >>     };
> >>
> >>     ...
> >>
> >>   };
> >>
> >> };
> >>
> >> Example device-tree:
> >>
> >> rpmsg {
> >>   #address-cells =3D <1>;
> >>   #size-cells =3D <1>;
> >>
> >>   rpmsg-io {
> >>     compatible =3D "rpmsg-io-bus";
> >>     ranges =3D <0x10000 0x50000 0x1000>,
> >>              <0x20000 0x60000 0x1000>;
> >>     #address-cells =3D <1>;
> >>     #size-cells =3D <1>;
> >>
> >>     gpio@10000 {
> >>       compatible =3D "rpmsg-io";
> >>       reg =3D <0x10000 0x1000>;
> >>       gpio-controller;
> >>       #gpio-cells =3D <2>;
> >>       interrupt-controller;
> >>       #interrupt-cells =3D <2>;
> >>     };
> >>
> >>     gpio@20000 {
> >>       compatible =3D "rpmsg-io";
> >>       reg =3D <0x20000 0x1000>;
> >>       gpio-controller;
> >>       #gpio-cells =3D <2>;
> >>       interrupt-controller;
> >>       #interrupt-cells =3D <2>;
> >>     };
> >>
> >>   };
> >>
> >> };
> >>
> >>
> >> Thanks,
> >> Tanmay
> >>
> >>
> >>>> To be more specific this will look like following:
> >>>>
> >>>> Host (Linux)                       Remote (baremetal/RTOS)
> >>>>
> >>>> rpmsg ch/device 1:
> >>>>     - rpmsg ept 1   <------>     rpmsg ept 1 gpio-controller 0
> >>>>
> >>>> rpmsg ch/device 2:
> >>>>      - rpmsg ept 2   <------>     rpmsg ept 2 gpio-controller 1
> >>>>
> >>>>
> >>>> The question is, how to decide src ept, and dest ept on both sides?
> >>>> I still think it should be static endpoints.
> >>>>
> >>>> I will get back with more reasoning on that.
> >>>>
> >>>>> On the remote side, we have to hardcode Which rpmsg controller is m=
apped
> >>>>> to which endpoint.
> >>>>>
> >>>>>> Or did I misunderstand your questions?
> >>>>>>
> >>>>>> Thanks,
> >>>>>> Arnaud
> >>>>>>
> >>>>>
> >>>>>
> >>>>> I gave this patch more time yesterday, and I think the 'reg' proper=
ty
> >>>>> should represent remote endpoint, instead of the gpio-controller in=
dex.
> >>>>>
> >>>>> So in this approach remote implementation is expected to provide
> >>>>> hard-coded (static) endpoints for each gpio-controller instance, an=
d
> >>>>> that same number should be represented with the 'reg' property.
> >>>>>
> >>>>> On remote side:
> >>>>>
> >>>>> #define RPMSG_GPIO_0_CONTROLLER_EPT (RPMSG_RESERVED_ADDRESSES + 1) =
// 1024
> >>>>>
> >>>>> ept_1024_callback() {
> >>>>>
> >>>>>       // handle appropriate gpio port ()
> >>>>>
> >>>>> }
> >>>>>
> >>>>> On linux side:
> >>>>>
> >>>>> So new representation of controller:
> >>>>>
> >>>>>  rpmsg_gpio_0:   gpio@1024 {
> >>>>>              compatible =3D "rpmsg-gpio";
> >>>>>              reg =3D <1024>;
> >>>>>              gpio-controller;
> >>>>>              #gpio-cells =3D <2>;
> >>>>>              #interrupt-cells =3D <2>;
> >>>>>              interrupt-controller;
> >>>>>           };
> >>>>>
> >>>>>  rpmsg_gpio_1:   gpio@1025 {
> >>>>>              compatible =3D "rpmsg-gpio";
> >>>>>              reg =3D <1025>;
> >>>>>              gpio-controller;
> >>>>>              #gpio-cells =3D <2>;
> >>>>>              #interrupt-cells =3D <2>;
> >>>>>              interrupt-controller;
> >>>>>           };
> >>>>>
> >>>>> gpios =3D <&rpmsg_gpio_0 (GPIO NUM or PIN) flags>,
> >>>>>       <&rpmsg_gpio_1 (GPIO NUM or PIN) flags>;
> >>>>>
> >>>>> Now in the linux driver:
> >>>>>
> >>>>> You can easily retrieve destination endpoint when we want to send t=
he
> >>>>> command to the gpio controller via device's "reg" property.
> >>>>>
> >>>>> This approach also provides built-in security as well. Because now
> >>>>> gpio-controller instance is hardcoded with the endpoint callback, i=
t
> >>>>> can't be modified/addressed without changing the 'reg' property.
> >>>>>
> >>>>> Just like you wouldn't change device address for the instance of th=
e
> >>>>> gpio-controller right?
> >>>>>
> >>>>> This approach can be easily adapted to all the other rpmsg controll=
ers
> >>>>> as well.
> >>>>>
> >>>>> So, dynamic endpoint allocation doesn't make sense in this case. Dy=
namic
> >>>>> endpoint allocation makes more sense for user-space apps which don'=
t
> >>>>> really care about endpoints and only payloads.
> >>>>>
> >>>>> But, here we are multiplexing device-addresses with endpoints, and =
so it
> >>>>> has to be fixed, and presented via 'reg' property. So, firmware can=
't
> >>>>> change device-address without Linux knowing it.
> >>>>>
> >>>>> Thanks,
> >>>>> Tanmay
> >>>>>
> >>>>>
> >>>>>>
> >>>>>>>>>>>> This way device groups are isolated with each channel/namesp=
ace, and
> >>>>>>>>>>>> instances within each device groups are also respected with =
specific
> >>>>>>>>>>>> endpoints.
> >>>>>>>>>>>>
> >>>>>>>>>>>> Thanks,
> >>>>>>>>>>>> Beleswar
> >>>>>>>>>>>>
> >>>>>>>>>>>
> >>>>>>>>>>
> >>>>>>>>
> >>>>>>>>
> >>>>>>>
> >>>>>>
> >>>>>
> >>>>
> >>
>

