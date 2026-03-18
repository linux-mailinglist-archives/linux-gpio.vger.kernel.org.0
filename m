Return-Path: <linux-gpio+bounces-33710-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oGKaJhxTumkAUQIAu9opvQ
	(envelope-from <linux-gpio+bounces-33710-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Mar 2026 08:24:12 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 09B702B6E0D
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Mar 2026 08:24:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8748C30D9EDF
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Mar 2026 07:19:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB8C12D8798;
	Wed, 18 Mar 2026 07:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Lw1Sj6ov"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A9DE33D51A
	for <linux-gpio@vger.kernel.org>; Wed, 18 Mar 2026 07:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773818350; cv=none; b=FE4GymlMPTcujnRqtvLKh9qcxNc8YOx8wfUW/X2vX5rA2xCxW/zh8xVz+n35wlmgVEuMMwxqKjcPO7ilWZs4L1/eYPpGhg691RcKdHDIWtuv582bmwU71yLXFqFJWNAzxqrZUZxUjeMuz6W/AyPlRMPROKPFZ/6qVzVC1kxczyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773818350; c=relaxed/simple;
	bh=ol8Ym5CKcekMlFDOEvyJrm6wbK1e1Xmsg6jJtPQ6+IM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CERb1EcK/zsjyfID7XYq3ETVh7MZgH3K8w/jwdqH7llsaF0SYivo/jjHh8f0CyIYzZkT6gPvXwkG1o8RVsjwkYNIDfz/UckDePks7s4HXV8KQPD281iEJyOOqyeYxWXfhzSo//EdqIAyM0K1uSXOALkATQeeImigroELuckOqbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Lw1Sj6ov; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-48538c5956bso5109835e9.0
        for <linux-gpio@vger.kernel.org>; Wed, 18 Mar 2026 00:19:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773818348; x=1774423148; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RrTjxBzkA8E/8TnT5udli/s694DpyD1FsJpsEGO43Ls=;
        b=Lw1Sj6ovj9EIZhyKaLbnabAY1o1VzAT/nfq+ZEVdU6YNAujwH/cghfTUdxErYUhFVP
         fTlLKvyQVQk0JmBb0aeTYrlOylaCcwsSokyMvC4/4C4CTlQyGntCd8uK3UtdXldP4d0L
         IeVuqrnsYKkVLgtnuKajimE+mDQvyjuFhNiZKMNaudfeWNoNa9iWlGTxmhNXzOFXKJhg
         E9WsSdVC7xhcSaaw7f+IKKVQXIzce9f7A8+1ziVoQ7zNmjS4aIdNuZb20q7E/w1uopWd
         aVz+1QDBPflkKycQSQZbuvUfh8HFE9TFTf58+1aMK8qwBcr4QCjRCyRifUez+aQrC4A0
         cjWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773818348; x=1774423148;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RrTjxBzkA8E/8TnT5udli/s694DpyD1FsJpsEGO43Ls=;
        b=YeRIafBtQ2Wtlx5E+KP/U+dqdxWOW7P8lEonCivPVFoKlnytGDqrXm9TeCvAeqYG7n
         cFCcYuttbO+uzY8GEXnwgrThkIM3paAszKYdXz5bPSzZ4/sS3Dnd/cPW+bs8dFEnZmGX
         VIRnCKmsWZf3Cni0qTtsedFpTFGCPyyfwe6U6H4hCevUGOJnpy0RW5k65I0+X1TWXz3o
         46rUqcp+I1X28Xfwbq2H6Mrq4xXW4bVBUQVtu6AK98rxy4JixfEdvNJqs6F1oyZvmqJs
         IkLs2nhWfXYWy05DLm7QjSzNT7mlFP68lGov/0OonZs8JvW+MvbY58fB5RF1VCz6EWCi
         ZpFg==
X-Forwarded-Encrypted: i=1; AJvYcCXw3nqj0pM82jRhRk7hf2r80mD5GdffHqdN/6beAcGZDu4Ed4XGQFA4bsmCXsvV7VKknWOdO8OMyfpH@vger.kernel.org
X-Gm-Message-State: AOJu0YyJhi5k1eveF1znemiupWU/jVIcACqXNd5+TI4Ctx1tWoV2vEgz
	GLaoun0oV5UtQ8HySHTDUiBHJdotHwpshl9LnKAVFlggE7fBNFvylGX7rp8fVD1VXZ0=
X-Gm-Gg: ATEYQzzg2t8TLveutz96lA22m5NOeoq+Q8odLkxPFBIIkeV2nR+kKKh341kb8ip74ZY
	hQyavawcCl/iv1j5pnd5jicrgx9fXol9ugT1WFYtLs969H22/sk42db86zNJUZjQoeNsUISmC7d
	sxarSvhYXAgRkmQlGy1jnCzdccx9GDyBzwaytx1TAX6+bC3QeqD9Lvxhfv0Z9Xw70nYnca0nHes
	C5HUr2daojlGxIPjh0rihKYzBkwakKtOkqogCeFmgKVtMHVRlLQtBeWFeJmOxBTNj3PullmiAaE
	Cq12PyjlLfnLDIg9RywjPPKnfVEj0Fan0jO2Ix3Q3z6VkQt3xt29SuXNY9YUWLU3H5YIk1ddv/i
	McoExalkDa9SzFIM5jcsXme4rjofg4RG9cCUJ/VEqIwsibHeJQQT5A9oVBO3282G0bvQp+kYfeT
	EUVoV8NNVpfl+gCOxrTAM9uHM/Jnyy
X-Received: by 2002:a05:600c:c4a4:b0:485:3c11:de84 with SMTP id 5b1f17b1804b1-486f40c9015mr31500395e9.14.1773818347740;
        Wed, 18 Mar 2026 00:19:07 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486f4bbcd78sm12200225e9.26.2026.03.18.00.19.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 00:19:07 -0700 (PDT)
Date: Wed, 18 Mar 2026 10:19:04 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	AKASHI Takahiro <akashi.tkhro@gmail.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Linus Walleij <linusw@kernel.org>, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Khaled Ali Ahmed <Khaled.AliAhmed@arm.com>,
	Michal Simek <michal.simek@amd.com>
Subject: Re: [PATCH v4 2/7] pinctrl: scmi: Add SCMI_PIN_INPUT_VALUE
Message-ID: <abpR6N6_4JgQTB4M@stanley.mountain>
References: <cover.1773757772.git.dan.carpenter@linaro.org>
 <940ff48bd53e35e19a4cda081170d9198c20675e.1773757772.git.dan.carpenter@linaro.org>
 <abl1fPQEDE38KZQN@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <abl1fPQEDE38KZQN@ashevche-desk.local>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33710-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,arm.com,vger.kernel.org,lists.infradead.org,oss.qualcomm.com,linaro.org,amd.com];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dan.carpenter@linaro.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 09B702B6E0D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 17, 2026 at 05:38:36PM +0200, Andy Shevchenko wrote:
> On Tue, Mar 17, 2026 at 05:40:27PM +0300, Dan Carpenter wrote:
> > The PIN_CONFIG_LEVEL parameter represents the value of the pin, whether
> > reading or writing to the pin.  In SCMI, the parameter is represented by
> > two different values SCMI_PIN_OUTPUT_VALUE for writing to a pin and
> > SCMI_PIN_INPUT_VALUE for reading.  The current code translates
> > PIN_CONFIG_LEVEL as SCMI_PIN_OUTPUT_VALUE (writing).
> > 
> > Add a function to translate it to either INPUT or OUTPUT depending on
> > whether it is called from a _get or _set() operation.
> 
> In three consecutive patches against the same file you have three (!) different
> prefixes. Please, align with what is being used most in the driver and/or subsystem
> (the driver seems has no consensus with itself, so subsystem then, something like
>  "pinctrl: scmi: ").

Oops.  Crud.  You're right.

regards,
dan carpenter


