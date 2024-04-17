Return-Path: <linux-gpio+bounces-5618-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F3BE8A8347
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Apr 2024 14:42:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C007D1C2187F
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Apr 2024 12:42:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7936913C3E7;
	Wed, 17 Apr 2024 12:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tORP0eiw"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F345381C7
	for <linux-gpio@vger.kernel.org>; Wed, 17 Apr 2024 12:42:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713357739; cv=none; b=mdColmLMB86pyca0eBNLVDnrYX4P6IXE/53IcxevxewBN2iFmX2XaEz5NIe+ZEAioGRFm/yPXb2Q8vfVaQCCvvO9EfS4moq+WkVrtqqqVoMcr8vsfuFBeZSmYGKD5ApfsXiDWX91UeVP/+Q2/h4NCTYE2RPj3GiRIHEn7XyStzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713357739; c=relaxed/simple;
	bh=AwKyjiWJRzagWC2MbqX3hFlf49pQyQ5paXVC/+7FW6w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n1fxC2l3zh7ZFM+1FEC3Ywu2VHSyEv4iQDlx1tlfgj4Ktk/cxT227YTJNlzZm1I7GYP7K0rwY2EA4fnS4DrfWewf6oLc1r5fyETVos7LT6EXYezIjjw1PzyUWefbHMtsy3VlCIMTP9JVH4EvS66Gyq5saMpSAMQR9QKpQGL7Rl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tORP0eiw; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-56e477db7fbso9131227a12.3
        for <linux-gpio@vger.kernel.org>; Wed, 17 Apr 2024 05:42:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713357736; x=1713962536; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hGxJr1eT1juIaCt0B8kVSHBgvMQ9mE5owuvsY4aMzkc=;
        b=tORP0eiwqw+a1r6TOse4RmmZ/RQ4NSz2P6C0H73xLpyIuqI8C4jppxyWdmFBB7L2sZ
         yhzgWAChJ29NdffoMaORYRKud2OHlWSPwv/4GoZ/IGgac1FfSzbT84UK4+7YEdMkQ4cR
         yZfKTCXCOZMAJB9gSulLQNDpTpYlRp4h5yhJSsksUn47qvC3c7F94rkEWibkNECp5SWD
         RboL9a4MJFOKfNjxv5liqS7gkuwHdaA0l3S/NKj8Y+NJ+BHm1mc97TspML3RivLRhn1p
         F1hU0f1261tHfSuhVZEnoN/NqsZVuNt0ldTvoz2pnPtSndCxMJvEixdESpfsM5DG90qD
         rH/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713357736; x=1713962536;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hGxJr1eT1juIaCt0B8kVSHBgvMQ9mE5owuvsY4aMzkc=;
        b=nvzCj8Ezn1PGPXrScdMBnmtgoXCLVO7p2RkHpPbCRwyosWEeQQafo9LBO4d3VmVeyG
         RuAInmH8TWkOCc0bqxOafwvI/ClgZZoK0YmarJ5If/RO0zZ6p5eMwvpeeVLNc+YmXilU
         P4jL6trDReJtvfoqNaUYeNQZnnEhF1eX0GMgTxz4eGTAlO8YVasrNKS+Ery5krxJgDuR
         /eidBt8dag3Wp36cd8JzQczkIMDO07d+01M05pESRi9GJI7x/MRfh6OpOdtFVTPBrDhL
         q4XWsNenwsIvtU5wpq5Dhz5vk4SVK+BFK2vuEhvZMBTgJD1wXP8vjn7R/mf0XvO6rETJ
         6nEg==
X-Forwarded-Encrypted: i=1; AJvYcCVX5n1kE5SLEPCirH7zXT6iu4Ow3Wttbb/K4B1y/Q+a8FChsFwmGqSkxmV9RTkyKoxGK+6sk9pItTE1EpoN1Ola9GLe4KwhxVgvYg==
X-Gm-Message-State: AOJu0YwA+2RyCeGf0wBByIlysBYciyUz8HKseV6IkRu5CEtkCU26pX7/
	9CAFbJ/QIhP7XXBoRtWgeCnc1msyBTFj/VktLzNulgr9GVfbtcKtHQpfhkx9Jbs=
X-Google-Smtp-Source: AGHT+IE7pfXIfIVm1oVxaQaBU9J4TOarr6VsYEeyJ2uNUE4J8Yrala0tsc/J6hnG5NT5hKmDzgbjdQ==
X-Received: by 2002:a50:d75b:0:b0:56e:2ab1:c803 with SMTP id i27-20020a50d75b000000b0056e2ab1c803mr11948542edj.0.1713357735666;
        Wed, 17 Apr 2024 05:42:15 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id en8-20020a056402528800b0056e2432d10bsm7248586edb.70.2024.04.17.05.42.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Apr 2024 05:42:15 -0700 (PDT)
Date: Wed, 17 Apr 2024 15:42:11 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Peng Fan <peng.fan@nxp.com>
Cc: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Sudeep Holla <sudeep.holla@arm.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, Dhruva Gole <d-gole@ti.com>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	Oleksii Moisieiev <oleksii_moisieiev@epam.com>
Subject: Re: [PATCH v10 0/4] firmware: arm_scmi: Add SCMI v3.2 pincontrol
 protocol basic support
Message-ID: <2c608b57-fe0b-40dd-a1f8-8f0808605ae3@moroto.mountain>
References: <20240415-pinctrl-scmi-v10-0-59c6e7a586ee@nxp.com>
 <6c652af8-151e-4d8b-9587-8eae1254a4fe@moroto.mountain>
 <DU0PR04MB941737BD9ACF18526D8A50C7880F2@DU0PR04MB9417.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DU0PR04MB941737BD9ACF18526D8A50C7880F2@DU0PR04MB9417.eurprd04.prod.outlook.com>

On Wed, Apr 17, 2024 at 12:15:57PM +0000, Peng Fan wrote:
> Hi Dan,
> 
> > Subject: Re: [PATCH v10 0/4] firmware: arm_scmi: Add SCMI v3.2 pincontrol
> > protocol basic support
> >
> > I'm trying to re-base AKASHI Takahiro's gpio driver on top of your scmi pinctrl
> > driver.
> > https://lore.ke/
> > rnel.org%2Fall%2F20231005025843.508689-1-
> > takahiro.akashi%40linaro.org%2F&data=05%7C02%7Cpeng.fan%40nxp.com%
> > 7C342dd6eb0463456d0d6608dc5e41de1c%7C686ea1d3bc2b4c6fa92cd99c5
> > c301635%7C0%7C0%7C638488884186606528%7CUnknown%7CTWFpbGZs
> > b3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn
> > 0%3D%7C0%7C%7C%7C&sdata=DMJZ2uwuJigkEnEcY7JdBw6DMPjHxcUvvh7
> > 2fsaep50%3D&reserved=0
> > I need to do something like this below to save the gpio information.
> >
> > So now, great, I have the information but I'm not sure how to export it from
> > the scmi pinctrl driver to the gpio driver...  (This is a probably a stupid
> > question but I am real newbie with regards to gpio).
> >
> > The other thing is that the SCMI spec says:
> >
> >     4.11.2.7
> >     PINCTRL_SETTINGS_GET
> >
> >     This command can be used by an agent to get the pin or group
> >     configuration, and the function selected to be enabled. It can also
> >     be used to read the value of a pin when it is set to GPIO mode.
> >
> > What does that mean?  Is that right, or is it something left over from a
> > previous revision of the spec.
> >
> > regards,
> > dan carpenter
> >
> > diff --git a/drivers/firmware/arm_scmi/pinctrl.c
> > b/drivers/firmware/arm_scmi/pinctrl.c
> 
> Just a short question, you will make this a standalone
> patch part of your gpio pinctrl patchset, right?
> 
> Or you wanna include this change in my v11 patch?
> 
> I hope v11 + imx oem patches could land in 6.10,
> so I would not expect big changes to v11.

Yeah.  Let's get your patches merged.  I don't think there is anything
in mine which conflict with yours.  It's just addon.

regards,
dan carpenter


