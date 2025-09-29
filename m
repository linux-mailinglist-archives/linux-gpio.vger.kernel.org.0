Return-Path: <linux-gpio+bounces-26655-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 65B93BA8727
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Sep 2025 10:49:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DBBB0189B121
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Sep 2025 08:49:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAC5027BF7C;
	Mon, 29 Sep 2025 08:48:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cszLsQXK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF8EB27702A
	for <linux-gpio@vger.kernel.org>; Mon, 29 Sep 2025 08:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759135733; cv=none; b=qj3OOjaD4a8CVvCeVM196yVg5SQCegSaYLyLdMtmCl11WgzQAhldVrmzPmePcAXqmUfkwZo+PmLPZsUGUeSNvpUQRdgObZyQgDczMRr0YhOOZ0j8LCBtwHydUjAf64OrfQ7JdVaI93sXj516GnKDVNPHOiO6WXg+gdfPHo4i9XY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759135733; c=relaxed/simple;
	bh=g1mm24DACTecjNAJvzrdNdg9fsLkeeEtFb5wtV+hB2c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mKu9M4qZcg8645svtOYFeT/8QQmKR9eSpHlfrjTddzHyVTtn83s0QTjU7fiugDCzASLf3yLEoXV1Zp4EX8VeTZv/SgOC3VSfOEIMFSnQjAq9YIFqzi/YlmJbvAeNsorj/z2+29gjRfMQiiqpsVDnyAd1pPle8MgN1RILfPFdtjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cszLsQXK; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3ece0e4c5faso3733329f8f.1
        for <linux-gpio@vger.kernel.org>; Mon, 29 Sep 2025 01:48:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759135730; x=1759740530; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Vltcl8v69f7bQvSIghkVp5oW+UsVhLKoUiMkT13h1P8=;
        b=cszLsQXKA+hQatxVZmdT/IBnFLmBjYDfohxAB8MmgODQ03G8bjEVJFjKbdAPdF5V4s
         dfiBpFj+vz8tqAffmc6Z8ztZLfXfddDbzo8RavdFxRhmjQ8oLD4LJsbyDEzQzdkJhi+B
         UV704jEiv/+Zvrs1TqiDUJf5575NlqkkaRUFfSFJ1brsnc9486v09Fiu8MSWF7A235X7
         y2rg0LMJttn+RufI7IoTyUO1gzjiUsPazyv6OJBn7MZlN1zyzuRNEyMJUwh798lrVPFt
         sV6ijIGTcerhi4304Of1MgyEXCkpITqMc6WUadzFh6XmnXt76Cc3vw9lvo/BNNvwLiUY
         BctA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759135730; x=1759740530;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vltcl8v69f7bQvSIghkVp5oW+UsVhLKoUiMkT13h1P8=;
        b=ayh3/hoshQacXecrEMCSbuyLJ8qhaFlYj9dgvFtIr9K/XP0E3G+UyhAaBj2LVfiisf
         UtDURgpbnHCp677OPXQ3T9jN/4nEy23FeYvr/TVTaKGL2nt4jcUBDP7skkKrFycrfC5w
         Ui2bTYhqL/e0X3ZIqt1xG1d02jRYmv63peiTGJVr+3wvrIJnxkyX04u40MGYBu27Mox3
         Lrzcx3WVtjG3iMZ0xlRKqvspFfDORk6xXY7IAkfom6sd87jG8Cac49Pah07s6zZM3g0S
         urnV1uVLh4yswwfkBITBQPBdQNJJBA8hJ8JBsSeIrXgmK8SWjEG12SVw/bGKza68suun
         9Gkw==
X-Forwarded-Encrypted: i=1; AJvYcCXgEuPPf0mJErqfmwpkper6g/L9xeWPLat7gC2qfWBpNzX2CLr069ykGlipKevCMWPPJGX9guf2vNfS@vger.kernel.org
X-Gm-Message-State: AOJu0YwR1CnJqkhNowNSEu2HG7G23JDUXdM+3gYYeELWOwpQe8KUNCI4
	R8KgXD98F6++UIQq5STteOs1qi3qwSBzNJMav2juGUFSXAR5wjh9xSyfsDUg0OUfLW4=
X-Gm-Gg: ASbGnctrUYuDmb2la85MMVOzgcM5Rs2WnJs8o7HqsaGKCErMcdk2yC+X+Lr1E4XPTil
	a3IsPygy7vwQAXNdJh04EWBgGa1ATjeoTsxE433ikqtMGus9fPX5RsMr8EDeTXEou3xpJIJkCWj
	bKef56wIrFUDAMCMB5v44oq3qiqpD7+WVUyJlT8OzU3IWgJIJ3JgXZyz9S5gPsXl5/B1pZJj1lS
	HnQhhi0+i6Z2Bcyi48rydmwGKZ2I8Q51XS+VKr5rZh4x+vb61UsuqSOPS4si22LsQZpYMePKdHS
	UsdgDy5jrHZ27ZYCHuc9n/0SnjkaKevB5AkgPMCG348dePqaWXKYmw06BtW66eMNiXUJ6+wryEE
	TJASHEP6DJ/aiwM18UEwQmpoAdeOJUCnXsGMRbsU03Zn3QCs4RQ==
X-Google-Smtp-Source: AGHT+IHq24YEQ+NGSgOKpmgkwFuU/SY2eluplaIZkQeebKuol6LbVx5PSlBlDAWVI5mgbmhWjPxYOw==
X-Received: by 2002:a5d:5f45:0:b0:3ea:a496:9ba8 with SMTP id ffacd0b85a97d-40e480ca410mr14224093f8f.29.1759135730161;
        Mon, 29 Sep 2025 01:48:50 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-40fc5602efdsm17883106f8f.34.2025.09.29.01.48.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Sep 2025 01:48:49 -0700 (PDT)
Date: Mon, 29 Sep 2025 11:48:46 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Mary Strodl <mstrodl@csh.rit.edu>,
	linux-kernel@vger.kernel.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, linus.walleij@linaro.org,
	brgl@bgdev.pl, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 1/3] gpio: mpsse: use rcu to ensure worker is torn down
Message-ID: <aNpH7gfhJXIBbCQZ@stanley.mountain>
References: <20250923133304.273529-2-mstrodl@csh.rit.edu>
 <202509290823.hreUi6Tp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202509290823.hreUi6Tp-lkp@intel.com>

On Mon, Sep 29, 2025 at 11:46:24AM +0300, Dan Carpenter wrote:
> a14b0c5e3b0741 Mary Strodl 2025-09-23  339  		/* Make sure list consumers are finished before we tear down */
> a14b0c5e3b0741 Mary Strodl 2025-09-23  340  		synchronize_rcu();
> a14b0c5e3b0741 Mary Strodl 2025-09-23 @341  		list_for_each_entry(worker, &destructors, destroy)
> a14b0c5e3b0741 Mary Strodl 2025-09-23 @342  			gpio_mpsse_stop(worker);
> 
> This needs to be list_for_each_entry_save() because gpio_mpsse_stop()

s/save/safe/.  #CantType

regards,
dan carpenter

> frees the worker.  Or kfree_rcu() inside an rcu lock or something.
> 
> a14b0c5e3b0741 Mary Strodl 2025-09-23  343  	}
> a14b0c5e3b0741 Mary Strodl 2025-09-23  344  
> a14b0c5e3b0741 Mary Strodl 2025-09-23  345  	while ((irq_enabled = atomic_read(&priv->irq_enabled)) &&
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

