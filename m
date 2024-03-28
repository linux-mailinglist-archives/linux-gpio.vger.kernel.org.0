Return-Path: <linux-gpio+bounces-4781-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E72FD890335
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Mar 2024 16:38:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2098B1C27B5B
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Mar 2024 15:38:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CFCF12FB35;
	Thu, 28 Mar 2024 15:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EUAIhv8w"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C9E212D74F
	for <linux-gpio@vger.kernel.org>; Thu, 28 Mar 2024 15:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711640278; cv=none; b=bOlBztbHPTJJQmizFGuEKdnFlXg1t+GGeas7jSNinrflZP/yphbLhTCXag9tACXy0jOoFPXtn+FSkf9K1CKTKrAVWMrpqXNNS23hE1nXqMc83tTbPVzg7ojIBl3oFAmRkiJqxjZZLR68Wu+OGRvtQGh3XSQTDYXLlAX3yf2UWcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711640278; c=relaxed/simple;
	bh=wrtkQUXt72sLMQI+K0oHfWPeA0OqB1bI7JA2SlyFaXA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qeR5nro8HKJAV52Q6wcnmYgUGpSL6qdDerF/0mKGUKPKcCG5l98irxmauvXQ1+s++1F5WfZyHvx8j/vSvu+Bf2lJ709LQNLRyJ6BNf9jUjnEBBUyQExfy7gjWhzWvNE7R0kJ8LC+WPP8Ly8MNbjfGbK8vFWYrbeFwG+bll2IZBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EUAIhv8w; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-56c2c41cbdaso636941a12.2
        for <linux-gpio@vger.kernel.org>; Thu, 28 Mar 2024 08:37:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711640275; x=1712245075; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ANzWgKm0bntWute8nMO1hl60enZ7+Hd5zAXwL8KZonU=;
        b=EUAIhv8wi6vqaNsIpJKsRVX0YCCAprRuY807v96tt0MKRjxxP36FNyaUBnBdIHIuZB
         ng3yCil6scZmaQ6NWqkwJLnpcAYGma/JqJUPCoATRh/nV/vQZQr0E6ppW05/Bg9TfBap
         yb+LdcfZzdivgeZIacOhZ7+hLExha7Glr0uQzmj5kRpZUpTMkiNOsY8z4o2JB/YB6H8T
         f2/Fxvp5AwgVaFFUusGpcTqBOoeKIc8mmzSMrEu7DE0X/6HgDgrZ/ioPtkFWfrruUhS0
         aRHzPVqGiNXcSbYzyqv394lU/PM8qItkyHBrshGr7mLkWHKTdsheFww+iQoRCIrAiExn
         QujA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711640275; x=1712245075;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ANzWgKm0bntWute8nMO1hl60enZ7+Hd5zAXwL8KZonU=;
        b=vyh1fn93gFyzxm/3dUu3cslkjcYKitCOldjFJUK3+BBSZ2Oq9zbCwyw27DyuLFU7fX
         /a0wPMZIQ8yBJfPltyQR6FTzJ7HfjCXnhMJgYxjItRUjLHgYJ2dlHVLqRlPAs9f6sE2N
         z7TMHBvcFZIdZZORScq8zH8jXYVIfvNJzN878u+ZHItf/lDKMxgLiBNx2TIBBxLS7Pvz
         RZT0N+9Y5JaXTkyexTcXayS7/HjyD1gblPYkpEIYw6WBJUA0LaGvPdlmSuIWGqJ/gROE
         J83tC9nsJBzY5cpTC8V8MeLBSRNuk6Oq0QnKutRcb3jm6nJCFI3zX8z9H2SY6vWzs7Wo
         z8Pg==
X-Forwarded-Encrypted: i=1; AJvYcCWCFkv0ETK4zkJRiZ5hZVjmyH81vPLiHZt1707DtSWS2MpmhLbSI5r1JdTqvVsg0Js0z2ix+uhdUZ7Mu2VlUBns9SYPE6GuKZ4B7g==
X-Gm-Message-State: AOJu0Yw3ztaOxwOUUGQUkCd04mfyzqjzU8UBEzup0xAi8xLVRYH7+E4X
	X/b6w1wbU46K1EMLlFKUXE1/VZ5Y4FfXS6woDb8V8vOiO5Nco2GkH7mjW7EEQd8=
X-Google-Smtp-Source: AGHT+IEd1tJMNzmMnWP8OVhZsGW9fLDR48HTGQ59gEJ78HKyA7dTvTQO+FhPNz5oIiDw6YXW4+Dtkw==
X-Received: by 2002:a50:9e64:0:b0:56b:8dcd:acb5 with SMTP id z91-20020a509e64000000b0056b8dcdacb5mr3410611ede.39.1711640274848;
        Thu, 28 Mar 2024 08:37:54 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id x1-20020a056402414100b00568d7b0a21csm947633eda.61.2024.03.28.08.37.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Mar 2024 08:37:54 -0700 (PDT)
Date: Thu, 28 Mar 2024 18:37:49 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: broonie@kernel.org, linus.walleij@linaro.org, brgl@bgdev.pl,
	linux-gpio@vger.kernel.org, linux-spi@vger.kernel.org,
	patches@opensource.cirrus.com
Subject: Re: [PATCH v2 3/3] spi: cs42l43: Add bridged cs35l56 amplifiers
Message-ID: <1123a418-c3c4-4f2b-b957-3737f3837b41@moroto.mountain>
References: <20240328140119.1784350-1-ckeepax@opensource.cirrus.com>
 <20240328140119.1784350-4-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240328140119.1784350-4-ckeepax@opensource.cirrus.com>

On Thu, Mar 28, 2024 at 02:01:19PM +0000, Charles Keepax wrote:
> +static bool cs42l43_has_sidecar(struct fwnode_handle *fwnode)
> +{
> +	static const int func_smart_amp = 0x1;
> +	struct fwnode_handle *child_fwnode, *ext_fwnode;
> +	unsigned long long function;
> +	unsigned int val;
> +	int ret;
> +
> +	if (!is_acpi_node(fwnode))
> +		return false;
> +
> +	fwnode_for_each_child_node(fwnode, child_fwnode) {
> +		struct acpi_device *adev = to_acpi_device_node(child_fwnode);
> +
> +		ret = acpi_evaluate_integer(adev->handle, "_ADR", NULL, &function);
> +		if (ACPI_FAILURE(ret))
> +			continue;
> +
> +		if (function != func_smart_amp)
> +			continue;
> +
> +		ext_fwnode = fwnode_get_named_child_node(child_fwnode,
> +				"mipi-sdca-function-expansion-subproperties");
> +		if (!ext_fwnode)
> +			continue;
> +
> +		ret = fwnode_property_read_u32(ext_fwnode,
> +					       "01fa-cirrus-sidecar-instances",
> +					       &val);
> +		if (ret)
> +			continue;
> +
> +		return !!val;

This should call fwnode_handle_put(child_fwnode) before returning.  An
alternative fix would be to use the new device_for_each_child_node_scoped()
macro.

regards,
dan carpenter

> +	}
> +
> +	return false;
> +}


