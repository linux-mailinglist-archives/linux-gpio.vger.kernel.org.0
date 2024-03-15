Return-Path: <linux-gpio+bounces-4377-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EC0687C8CC
	for <lists+linux-gpio@lfdr.de>; Fri, 15 Mar 2024 07:27:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 507C61F21BF8
	for <lists+linux-gpio@lfdr.de>; Fri, 15 Mar 2024 06:27:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A4121427E;
	Fri, 15 Mar 2024 06:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hi4E6Ocl"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 305F61426B
	for <linux-gpio@vger.kernel.org>; Fri, 15 Mar 2024 06:24:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710483851; cv=none; b=fyBe3THqmDX4bs496GV6o4/5r8T1wgn6G+/EDni8DCX3P1UHk+YL4lxTcj1KMmh+3YZpovq3sSHFrlFrNOqXK9CtxxMnZxkZO5TJE4q4Ik/LZaSJ98eLH/R3NgOBHe1mlzh3nLhDG00IGIk3rP6MXJaVM105qwXqnLvt/nvoIEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710483851; c=relaxed/simple;
	bh=8hatKKv5/7R423aa6ntHditmiT/I4Zc0RS592ZzdzBo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rimqn03prUr+elpiuoWvFM5auApvSa1kYUPee4DXAKysCCkp3ZUa30GXiPVoW13kk5orHeXsM38jYwaMhftbnbFrQBUB98bsOr8BEcafIQMImmMJi5RlwZvsj9e1ULsfv3aO1i0LE5UywODAUA1Rt0KIBi8D1T7BpuGKOZM6HMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hi4E6Ocl; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-41401f1d665so902265e9.2
        for <linux-gpio@vger.kernel.org>; Thu, 14 Mar 2024 23:24:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710483847; x=1711088647; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=s9LPhepAIkivg02JjKy3gGkvg0KX9KjTZMR9ul/pzXw=;
        b=hi4E6OclXfSNhOQsILaTH56uAg3eD5I+wY6oZTBCxOBnao3ofmJkn4TGM70t91fqXZ
         IJl/pdCOtoJRVidZt3/9fi4gQ5MhYBRz8KkDWrd1MSAZ77MI/D2034HKDNIMRf8tkCPs
         2uQSurVlurkVAxHfwvs7iqEsmkGPibL0lTnKCFf+AeWd3lP4N2/Z9FUJoofN8oRJF0I2
         lJBbfRQfgRZCcip6AKN+lXxjMCrG4SdDFuofFJD+ge+tuC1ZVDaAeQ8ZFFHt3rF+qJb5
         /VfNbYAdmTN8GC63NhnSmF1ZYYn+BtAElEG19SpRxKfg8xH73jGN0IOdjblYI+6T44rp
         p/dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710483847; x=1711088647;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s9LPhepAIkivg02JjKy3gGkvg0KX9KjTZMR9ul/pzXw=;
        b=qPUIJxgHBWbFQXPK1QMNgsfp3HZtC8eG8XqLM4GeqVKP+ZGZ1Fh8CqG+dyES2aKwX9
         ukDQjYu79CizykbdZy2WNq22bWLlINKI/WFlzoeOpXvJYIamcCdcg78VGHtul6iX0E2H
         PqrOYVbd1iEmI+zCZip2W6gh7jaZE1tFr8/3+1eTujroRUsJ8HLKGChVajgL9fsB16x4
         DWJ6ZeI8qjZU+Dg2IZPasAUsoP/UWr5dtk/UzG18r77rUn1NRdjv6jq63c3uV1+XpxML
         E6OqHhKB2IeA5fy5QSNJg3cVpsP1f/p9bezd8InTuKIWB3WVBZKTyQcK2dDtWwTLXt7O
         XO1g==
X-Forwarded-Encrypted: i=1; AJvYcCUodYc2ZotcVyvUdcrYn/w0TOYTwGpffPh8x9OCtUGDPJUoYttlIsT5MnYnrNnqd7gu6GDjswYUV36JSzb75se2PzVONLcwqSh0pQ==
X-Gm-Message-State: AOJu0YwwnH8yVPvtHv77Gslin7TKFDh+uClbmDKxiu7GtgkRY+Vv1PZy
	bMDFeTqOoE5sz8OwIkofJdzgwBC2ZeaPmpuQ/5BoW+3AgcaVe+mDni4huRbAGXc=
X-Google-Smtp-Source: AGHT+IGuc1jijyMO18jNQFeSjG/gNhcDM/wtNd54nQwkBqzISLhJ08o59pWhpo7tuOIhvoHzQzAu1g==
X-Received: by 2002:a05:6000:a90:b0:33e:4238:8615 with SMTP id dh16-20020a0560000a9000b0033e42388615mr2698769wrb.40.1710483847319;
        Thu, 14 Mar 2024 23:24:07 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id dd12-20020a0560001e8c00b0033eab3520a9sm2384912wrb.43.2024.03.14.23.24.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Mar 2024 23:24:06 -0700 (PDT)
Date: Fri, 15 Mar 2024 09:24:02 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Peng Fan <peng.fan@nxp.com>
Cc: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Oleksii Moisieiev <oleksii_moisieiev@epam.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	dl-linux-imx <linux-imx@nxp.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH v5 4/4] pinctrl: Implementation of the generic
 scmi-pinctrl driver
Message-ID: <64523bd3-d208-4989-b8d9-57952c77954c@moroto.mountain>
References: <20240314-pinctrl-scmi-v5-0-b19576e557f2@nxp.com>
 <20240314-pinctrl-scmi-v5-4-b19576e557f2@nxp.com>
 <55ec2392-c196-4669-a339-12ef336707fa@moroto.mountain>
 <DU0PR04MB9417F0C53A0B112E7A8A334288282@DU0PR04MB9417.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DU0PR04MB9417F0C53A0B112E7A8A334288282@DU0PR04MB9417.eurprd04.prod.outlook.com>

On Fri, Mar 15, 2024 at 12:44:34AM +0000, Peng Fan wrote:
> > Subject: Re: [PATCH v5 4/4] pinctrl: Implementation of the generic scmi-
> > pinctrl driver
> > 
> > On Thu, Mar 14, 2024 at 09:35:21PM +0800, Peng Fan (OSS) wrote:
> > > +static int pinctrl_scmi_get_function_groups(struct pinctrl_dev *pctldev,
> > > +					    unsigned int selector,
> > > +					    const char * const **groups,
> > > +					    unsigned int * const num_groups)
> > {
> > > +	const unsigned int *group_ids;
> > > +	int ret, i;
> > > +	struct scmi_pinctrl *pmx = pinctrl_dev_get_drvdata(pctldev);
> > > +
> > > +	if (!groups || !num_groups)
> > > +		return -EINVAL;
> > > +
> > > +	if (selector < pmx->nr_functions &&
> > > +	    pmx->functions[selector].num_groups) {
> > 
> > If pmx->functions[selector].num_groups is set then we assume that
> > functions[selector].groups has been allocated.
> > 
> > > +		*groups = (const char * const *)pmx-
> > >functions[selector].groups;
> > > +		*num_groups = pmx->functions[selector].num_groups;
> > > +		return 0;
> > > +	}
> > > +
> > > +	ret = pinctrl_ops->function_groups_get(pmx->ph, selector,
> > > +					       &pmx-
> > >functions[selector].num_groups,
> > > +					       &group_ids);
> > 
> > However, pmx->functions[selector].num_groups is set here and not cleared
> > on the error paths.  Or instead of clearing the .num_groups it would be nice
> > to pass a local variable and only do the
> > pmx->functions[selector].num_groups = local assignment right before the
> > success return.
> 
> So you concern is I should clear the pmx->functions[selector].num_groups in
> err path, right?
> 

Yes.  If functions[selector].groups is invalid (NULL or freed) then the
pmx->functions[selector].num_groups variable must also be zero.

regards,
dan carpenter


