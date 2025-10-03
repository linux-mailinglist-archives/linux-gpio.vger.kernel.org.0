Return-Path: <linux-gpio+bounces-26800-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EA0C6BB81AF
	for <lists+linux-gpio@lfdr.de>; Fri, 03 Oct 2025 22:29:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 04B133C1E20
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Oct 2025 20:29:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75DCD227B94;
	Fri,  3 Oct 2025 20:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YG0Tytop"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6715C22A807
	for <linux-gpio@vger.kernel.org>; Fri,  3 Oct 2025 20:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759523377; cv=none; b=Y+WmV6YkAxp5TlT2lptHgmvWfdMzBslb9sf0f4XZiTA+92i3w0kbbvRDICFLU4q6Rh/l3Zv45aYFrCXWSzFHK4ZEnkcMWqFCq4adFydA54FgoMbTF3CdTub3wXTE/PCfkFGbm5AZ8SZdck+NEenwiINNz0l+WfWAmukdIG9pguU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759523377; c=relaxed/simple;
	bh=SuOGf6ig6UThy/Cts9AqHIbtylVDtns8fl8RhAUSMZo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SOBBdA2CSXny/+JuARuaDD0CkECnTxAAaDBC9R2JGuxK49YG+kig8pyiOCSMfSbpdccAN8NLIix/lB2N4h2GwHi45R2PAr5/VLyu0RNtLBHk3HESUBCHf/R6VRhqmEDUHvBPao/LUBG+lN8OFLvadX23yZVM3oqH1nQRA2jCpdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YG0Tytop; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3b9edf4cf6cso1988456f8f.3
        for <linux-gpio@vger.kernel.org>; Fri, 03 Oct 2025 13:29:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759523374; x=1760128174; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8BGUE0v7XRga+qkgvLP86a6O/SLAuOYc4ngsK7oGTUk=;
        b=YG0TytopFtukvAc6AOCqkN3jFCZjSQbVbonbkUdFZoSdPfPsu2jM7D/2gWDcsdqMHZ
         nX85yigXidryzzuJG6j3KTheUMo/SFYQJ8sQdIvlrVexaQzcPAMQxPJiOHao+O4eQJMj
         V1sHz7egbxAZ+8rfcNLNuy+A6j3aDgPaX4ohfkI8+7pIAOQVmgVpAApaC/iU+wOQkpFF
         UWOlQVE2L8mN0BmeqTPao9HQ5BfbYbZmYoCKCjpUI8irZyMPPtmOwLlN7Vpqubzvto6F
         qVEo/L9Qe+Rks8M8ev/aEPEpB0XIJD216xqncq8iJgUpzzKe6fsf6EYgOX/PlUd20zJR
         Qx5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759523374; x=1760128174;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8BGUE0v7XRga+qkgvLP86a6O/SLAuOYc4ngsK7oGTUk=;
        b=Yf1ToB3EP3mf405poQQ7X1ijeyZBVGRe/lOOhGg3199OsSBgtBZb7EdL2njqmsox6J
         At5fZc3jVqecNKrSkvGkuOIXAHFW/N8X+40AQkS9JoMPf6sCI3jXiirzl5JVM3ga7r0n
         HXIY+iimpw3Pyq1Z+Dyr13HLPnta/oht/AFVnSMcEO2El71XRuX6wWTi36o/qQC4qpEt
         45ohplVsA0MNlre4AncaS17H3CASQHI43DZk1SoVX9c66QO3z7BD4Xy6aHOGI4ZoQBb5
         iUeX5JByS7on1SAaY3v2WZkM167IbRVzrqvrCViiLog2i85IWVxgyqQWH2zbOVj30+0+
         GXLQ==
X-Forwarded-Encrypted: i=1; AJvYcCVkE5Bd0b/zvRqdTFnOrKJ93p37QD3etbw4ty6ll1IlOGcY6KC1N9U7CN5tKLOb7aLIUz8aDv2HqLP+@vger.kernel.org
X-Gm-Message-State: AOJu0YwoAIgxSvPbVdWzfRdNGzRawaDbn58nFLvJ0PZps+9zCu275mNO
	Jptev8N4/KBqEMNbVRh6/0ZVAWf79FJqNDZIRJJBQyvjafXAt+IRuGtZ5SMclL9b+UY=
X-Gm-Gg: ASbGncvy9XeutuVrV5hiLYqTq+uyJqESob3BvpH4yaPv3pjyEVAsElC+6h/2YOhoqCU
	QqHayiF47RVlhDWxI0zWfVpuBlDlEHRjnpO7H0HdtPEnsn9TfFgk0E9e/q+SfXiHD/KE39HaDIi
	agseTf5BsUlYp890o77TvyfaI/2JoEDQIYC6vofL3bt2y+y1VPsef3HKb2obvtV5j9KRbS9LsL4
	zqiOEAeAYmEox3ecJzQbJyxi2+ydLO9fg4fOGGurZ+Sl4W+MZrqmWc/rKML1rQcf32QCwJIAnDl
	Jx4Va4cj9wp+hJiEHJ6wm8t49Y8JsxuN5OMJQ/0NmQ1DGSTIaK6Ijvu45xEft25Icmw5P2HAC5u
	NFK8kQTqttJKBHv9DZrYM0hiNvo7/pK4ZTbczApzKSqezWPVqHzdu8DLFEiHdgoIsuwg=
X-Google-Smtp-Source: AGHT+IH/bgx1fSGeKfmK7NrfWKs/RA99sx3ypoK059B/EoGdkmTKRCEZWYZj6hui2YkbxqO7xxGCRw==
X-Received: by 2002:a5d:588e:0:b0:3cf:74e0:55b9 with SMTP id ffacd0b85a97d-425671c71bbmr2893944f8f.63.1759523373488;
        Fri, 03 Oct 2025 13:29:33 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4255d8e9890sm9409932f8f.32.2025.10.03.13.29.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Oct 2025 13:29:32 -0700 (PDT)
Date: Fri, 3 Oct 2025 23:29:28 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Mary Strodl <mstrodl@csh.rit.edu>
Cc: linux-kernel@vger.kernel.org, tzungbi@kernel.org,
	linus.walleij@linaro.org, brgl@bgdev.pl, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v4 3/4] gpio: mpsse: add quirk support
Message-ID: <aOAyKI7hv36oLJkD@stanley.mountain>
References: <20251003195036.3935245-1-mstrodl@csh.rit.edu>
 <20251003195036.3935245-4-mstrodl@csh.rit.edu>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251003195036.3935245-4-mstrodl@csh.rit.edu>

On Fri, Oct 03, 2025 at 03:50:35PM -0400, Mary Strodl wrote:
> Builds out a facility for specifying compatible lines directions and
> labels for MPSSE-based devices.
> 
> * dir_in/out are bitmask of lines that can go in/out. 1 means
>   compatible, 0 means incompatible.
> * names is an array of line names which will be exposed to userspace.
> 
> Also changes the chip label format to include some more useful
> information about the device to help identify it from userspace.
> 
> Signed-off-by: Mary Strodl <mstrodl@csh.rit.edu>
> ---

Thanks!

Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

regards,
dan carpenter


