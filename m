Return-Path: <linux-gpio+bounces-16438-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 61E11A40F29
	for <lists+linux-gpio@lfdr.de>; Sun, 23 Feb 2025 14:57:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 452C8175234
	for <lists+linux-gpio@lfdr.de>; Sun, 23 Feb 2025 13:57:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A815206F25;
	Sun, 23 Feb 2025 13:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=remarkable.no header.i=@remarkable.no header.b="HQUTgNp6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33CA11C84B4
	for <linux-gpio@vger.kernel.org>; Sun, 23 Feb 2025 13:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740319028; cv=none; b=V+8+X0s8OR4KmHcR80H8XZoqNigLzAGJp0T7CpKY7swFB4ouk/tnWfO+iO0wgSUlLrxZTnZ+LZFsJuqEQbGEhBMSrxJB6SK/7oJc8LcFe2oFAecp0z1iE8G6/c0fDnZ8GGsIAOCEWsWXM0JYN6K6NtljI6k1WKK0trXOdkRNG8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740319028; c=relaxed/simple;
	bh=b5sKo7or1yxhOykhB8W9cO08pjMsuK4KXAFBMM1a5/A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Rb2EWXCeF6d/tKTmM2O6Ro2fY0s1R/nmD8o/n+7bKgNzO8Y12T1lAAsLH8Q4wFk1Evj2P0Cklyh9nl6Pjz2S0a5hxjdH7tda8E1CLwjWr77+mrLPN2xrCX0BayXca3cFbridjqtuwc03bK9NOJL9pKb3ITGn6W+p9Hdn6MLZAF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=remarkable.no; spf=pass smtp.mailfrom=remarkable.no; dkim=pass (2048-bit key) header.d=remarkable.no header.i=@remarkable.no header.b=HQUTgNp6; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=remarkable.no
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=remarkable.no
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-30613802a59so36551091fa.0
        for <linux-gpio@vger.kernel.org>; Sun, 23 Feb 2025 05:57:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=remarkable.no; s=google; t=1740319024; x=1740923824; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oSt5Oh4aOXUsbkkdJcXi4r7HM5aKQql9O5bNB1EciEQ=;
        b=HQUTgNp6BFLHrx9eCuJVJ3O8J0lgYMaCJrZRrEKyeumMjNiXQgcMRS8xeoCs/ZCGa3
         it8bcukNDMYxxALh0bTmtEnYzPg59YpmiyCOnE4Azq5onFon9maILw1Dgm9/ZwbpLKIh
         mXGvSqn+uq+/+cpgmljnzBkND4c3GHM6uzEgDWtsxS3zb9bnGDt29J6DeQHGvPCwkVVq
         PWbmi5F1Ou6DrWkvCZuZgKdLvPeq6Gc5YQqwqI6941MIBF+hXY582Gpx7ufYnyfZx0+f
         qVSaGKjfMpSYUYj1MDRdmXp6O7EPE9pWsMk0yW20rV+wMrhoA+Tw6gVPg2ZnzNZcDfQG
         0H7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740319024; x=1740923824;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oSt5Oh4aOXUsbkkdJcXi4r7HM5aKQql9O5bNB1EciEQ=;
        b=RQ1Bw2YMhEq3w2tc8seJIxX8sDpB1IoE+gvd8+Du3GV/9ObcWYV1gs8lFZRe/MJZ0s
         Upv5uATnJzrbJTLj3A5hNVTz1aMMeqjSMTzAOPHcZ+Te+qY42S9ZqZ61AZ8wxaiQG4Wk
         wAS8Xtjinjn4K39lwzCmz8ep2l+1WpBMTgKVVpjlo+6GSCm3nx5NKmGO5Pm53w8U+Av1
         H+7AAaBPWB5varEFn3DnfxnjdeAqN7ZOtDZVPVHIWOOFyJmQeET4l7MaXwv3B/2suPQ4
         qlU4RxsYBWTraWgyA0a7PiXiglNL+Zs6xOVAH8Bp1cBvolJ1PIrWWGSuwFL3785qeAjA
         dcEg==
X-Gm-Message-State: AOJu0YzE4U//oED06RKTCSGlsBCf1oUPfqVmqEGIJuQlZDMQbSLxf1/s
	8j5qtJ8t+9+2D57FfkYnbNUMy4zW3/DmkFGkKkcF7oSsjNU+zJ72v7Qg32WFrg==
X-Gm-Gg: ASbGncuD1K/o/bwG9Tc7lXlT+6/Op8O6dhbfxFULPx9Ii6QOhjJVBLnDm87m/uhPBxQ
	ewu9AhG4npDEoyHqvIh+jHcScWo8qVixgjQKqfC0MI6CP7cuFXQcp6ITeYaHsat2aDU66o0peDw
	mOLage8cuq5fZvhqJOf/obd3hZ5wu4p5qrsl6QCXybgSMAOcEY6iaQ4lo4frUUR55bLXOItJUIx
	UQgY8e48X3cMb1mSYpk2ai4hzg90vPrUQQSUL9KqlVaMVpn8obcP4tBR1qYmBs4WNED+OpFsRZ+
	dX0JtZlBTx9DgUu81C1oQTlphzzO8OXiQxWb0UaQMR8d9TJGrv6qGOYaNZXT39QC8tdkBYcSKHV
	i
X-Google-Smtp-Source: AGHT+IEsAPLG0VnAgEWySFLvjEpv9b6lcCK03yae88Y4++t5RMI5NrCMFxRtv8orcMuGnVhJE1uZKw==
X-Received: by 2002:a05:6512:3995:b0:542:91a5:2478 with SMTP id 2adb3069b0e04-54838f4eee6mr3963231e87.32.1740319024112;
        Sun, 23 Feb 2025 05:57:04 -0800 (PST)
Received: from ?IPV6:2001:4643:2b9c:0:a407:a1b4:766f:a8eb? ([2001:4643:2b9c:0:a407:a1b4:766f:a8eb])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5452ba47793sm2794112e87.249.2025.02.23.05.57.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Feb 2025 05:57:03 -0800 (PST)
Message-ID: <37e3fbc9-87c2-49d4-bf32-e4c5906cdad6@remarkable.no>
Date: Sun, 23 Feb 2025 14:57:02 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] gpio: vf610: Switch to gpio-mmio
To: Linus Walleij <linus.walleij@linaro.org>, Bough Chen
 <haibo.chen@nxp.com>, Bartosz Golaszewski <brgl@bgdev.pl>,
 imx@lists.linux.dev
Cc: linux-gpio@vger.kernel.org
References: <20250219-vf610-mmio-v3-0-588b64f0b689@linaro.org>
 <20250219-vf610-mmio-v3-2-588b64f0b689@linaro.org>
Content-Language: en-US
From: Johan Korsnes <johan.korsnes@remarkable.no>
In-Reply-To: <20250219-vf610-mmio-v3-2-588b64f0b689@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2/19/25 10:04 PM, Linus Walleij wrote:
> After adding a pinctrl flag to gpio-mmio we can use it
> for driving gpio-vf610.
> 
> The existing code has the same semantics and the generic
> gpio-mmio, including reading from the data out register
> when the direction is set to input, and it can also handle
> the absence of the direction register better than the
> current driver: we get the direction from the shadow
> direction registers in gpio-mmio instead.
> 
> Since gpio-mmio has an internal spinlock we can drop the
> direction-protecting spinlock from the driver.
> 

Hi,

Could the following headers be dropped?

#include <linux/pinctrl/consumer.h>
#include <linux/spinlock.h>

Kind regards,
Johan

