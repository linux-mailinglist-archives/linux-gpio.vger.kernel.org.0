Return-Path: <linux-gpio+bounces-5499-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 827278A4D54
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Apr 2024 13:08:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 113ADB22D48
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Apr 2024 11:08:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAE175D47E;
	Mon, 15 Apr 2024 11:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SP6yQvH9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EA395D477
	for <linux-gpio@vger.kernel.org>; Mon, 15 Apr 2024 11:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713179327; cv=none; b=aC13UfLU7H8+ou35lW7eBQtw/HiD7GPd04C9yy94n+tmLZe73SYxmMe6NLlVfll8jApepMGh+IYpdOxysSWYsybZSl0mppE96W4J5EIMmfuk9RBxNs/LvkbmOK55kPqhsc2izpx9UvgNRJhiz3x+Al2xEXZast3MLz2eDzd8OuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713179327; c=relaxed/simple;
	bh=eWZ4SE0VfIGB196vF8TDN8VWBaOVe9vVQJNsTIzQG34=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TtURvYR6v4VFIeFzcqXZcg43xbOcDEE5R1O65njmcG+i4VAQjNuWVFqhDzpdVw4wcI63xqrzFulYcNpyT+MX7Ae15fTWAtwLimrVBzoeH4IGXLio0Y8t7a1OmRC618W/AN6e5rvKS20HfZ0vCD0BgOxoTrIovhEqjDQwbzMiL5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SP6yQvH9; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-518a3e0d2ecso3091654e87.3
        for <linux-gpio@vger.kernel.org>; Mon, 15 Apr 2024 04:08:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713179322; x=1713784122; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3380gI0Nj7jMG48jHd6uITkRP1ddHwOHc3O4ogiMMkI=;
        b=SP6yQvH9aa8V4WbY53KMKGVPaDCAxYJW6Qma3st47KqbhuyMZ1FF7NYPjt6XqtLIvl
         MlFnAI0GnkBTqKmQerU79cOznNhBE/qAtTLKJdOOzfxIVD4JNSR3ofVnfmA8zPBaHo+s
         03wtyfOYQxEy2hlCJCFDXbgEib1efNw5uWN7qnHXDvnFDssDMJQOnInApGgW48HsdkVy
         J/Fb8r2oDFMEeFRV1t5GnEBY4HQM6ovKqMOBM9KFZ8jfMgFi9BtrPmPP/IKknEI42AsH
         L67+AvMWT2EfZE7i8I0gbosGHOnah5unRqMkEtI7FQnHpkdXo/0zVUApGtuNHyyd2qah
         zOuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713179322; x=1713784122;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3380gI0Nj7jMG48jHd6uITkRP1ddHwOHc3O4ogiMMkI=;
        b=PPNADsPbev9qMEfhugxs9cwLB7XZdp1BPyirFYCNZFoZ5SxDAh1xrRd2lgBIu7UDnV
         6JRqr8vZHxhrPUG4X94d5O78yD8AHVhH4Vb3e9zX73TQqy3fW7ZuA4E1pSRWc/WqFmjl
         FcKHqi9kBrbqFWfPfWmjznt0GOaDO3+4vmdVZgU0WLJM9yD6YsLRUWvuwf/ElVdc0esg
         t08P3oXd3fGFA8RfS5KAP6+sd0sN38Gqdmwwu5UGEJKtP6AMdIipc+WoUAfKxWlxomlL
         Gu+j1TSSdhxpcYlxdSYQcZKJi1lQx9NKoDCp9yrV1aZb+ttjHO3tA/w7kYo8V/Ow/jqP
         XVIw==
X-Forwarded-Encrypted: i=1; AJvYcCWTp8kJW3pIewr8/oOxp5DmuBpos2sGeUNOi3DV8PTqZs+V8EJPifiOy8EuPmOnMDFqaSGR342nYR3Pzn6wzS+qwE5lZdQeu1HQ3A==
X-Gm-Message-State: AOJu0YwCNpYAV8EFYHV3Zh1bhQrwl+3YTQl3lJzBjZ8vnJMQDaH1xieM
	1MQpCA3n0DbzwpN5vrY3tZvYJNulxxa13lwaFV6m9T9C9mkmhFoKhq/5E7z/ufU=
X-Google-Smtp-Source: AGHT+IHzRY+Km+K+uNC5WrZH12Nr3LIaMRqEWHjF2lnS92jC7N2zOBTxs89YvPsBydrkjwa7agmHig==
X-Received: by 2002:a19:640c:0:b0:515:af1f:5bad with SMTP id y12-20020a19640c000000b00515af1f5badmr7146407lfb.28.1713179322078;
        Mon, 15 Apr 2024 04:08:42 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id bf14-20020a170907098e00b00a52225b44e4sm5203616ejc.115.2024.04.15.04.08.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 04:08:41 -0700 (PDT)
Date: Mon, 15 Apr 2024 14:08:37 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Zeng Heng <zengheng4@huawei.com>
Cc: linus.walleij@linaro.org, linux-kernel@vger.kernel.org,
	xiexiuqi@huawei.com, linux-gpio@vger.kernel.org,
	weiyongjun1@huawei.com, liwei391@huawei.com
Subject: Re: [PATCH] pinctrl: devicetree: fix refcount leak in
 pinctrl_dt_to_map()
Message-ID: <637f9185-3fde-48c4-9a47-30987c8dd5a2@moroto.mountain>
References: <20240415105328.3651441-1-zengheng4@huawei.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240415105328.3651441-1-zengheng4@huawei.com>

On Mon, Apr 15, 2024 at 06:53:28PM +0800, Zeng Heng wrote:
> If we fail to allocate propname buffer, we need to drop the reference
> count we just took. Because the pinctrl_dt_free_maps() includes the
> droping operation, here we call it directly.
> 
> Fixes: 91d5c5060ee2 ("pinctrl: devicetree: fix null pointer dereferencing in pinctrl_dt_to_map")
> Suggested-by: Dan Carpenter <dan.carpenter@linaro.org>
> Signed-off-by: Zeng Heng <zengheng4@huawei.com>
> ---

Thanks!

Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

regards,
dan carpenter


