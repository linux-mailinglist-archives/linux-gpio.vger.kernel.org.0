Return-Path: <linux-gpio+bounces-5235-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D35DA89D9E4
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Apr 2024 15:12:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 88A611F21B4B
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Apr 2024 13:12:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9927312EBE4;
	Tue,  9 Apr 2024 13:12:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lk8InygF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3503129E6B
	for <linux-gpio@vger.kernel.org>; Tue,  9 Apr 2024 13:12:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712668326; cv=none; b=PRqhj9KBTxj5uPlntN3LO+uxfWAM93bHfqydgwCdrGSgxF688FOyM8XCFo+vkuWDz1cQx1IoGPN1iI4wgK7O/Au5Di0fB7BNU5RALtKJwXZMr1Ak6LHvv3g4Ob0labGtbZmPAYg+Sfn7uDs74KHMiTJnbi2Mzld/4WszRxaDuD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712668326; c=relaxed/simple;
	bh=Qbb1SaNMxRxEzHP3GQLID2BWvVZDuahFp7k4cgsczbM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oXb9bp5HJoaGz1NXE4lnglgbVV0ctIfnCDBHXrv3L4rfvGTRABQj+g1RRUhI36yadOL0Vx9OU4Jk/M8rwCXtV0OYTNdskFlseultl9E/TrSIKvMXCsKZFR0Pj8/RKCQc9NwGIY5dbssVbtmBs/rkpmBS5qEPrpTLXP64vIShR1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lk8InygF; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a51fc011e8fso71140166b.0
        for <linux-gpio@vger.kernel.org>; Tue, 09 Apr 2024 06:12:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712668323; x=1713273123; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JWFiERgbDrqglVNz0ES2yAG+uCVNz/oGLkAHA4DEL/M=;
        b=lk8InygF9JBPbMJlfI3FOTaTnKvVP2+vY+7HlS8avb0GA5u4xvY4oV0+tyPEpnNbtK
         TGFZdkKf1ASaD3gVpS+NB/D69QIExmxL5n0oWgra6clZp5fPVZ6Jf9JqUS0iNntX/GZM
         0aXS4BjZeqZVZ4HO5+YJKPaX+Aqqkmq5k1KUVM9z3/T28FiqJC4Sz9fLcbWEvlW7ppwe
         HMrzD1ZpjBFkziD4R5hKjkRThZhXfIGZu+NAFr0f0JIHqxKpJrWU9frtotnrqQeIr41m
         ZkCt4QxrwiJQjNF1nC+HYF/fixM8KoiXiLpk1uE++pkwnrNbnSBqpd/U5PIwA78EAvSx
         1JPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712668323; x=1713273123;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JWFiERgbDrqglVNz0ES2yAG+uCVNz/oGLkAHA4DEL/M=;
        b=NRyohIfIu7strzvqPy/jC/mPAixHrdxNqi4wO2ASWoPb2aeu64YW2ztbM01G30I1Tr
         IwpVUTP/vZa51rAMOAzZR2vNhJ5q2yY03EczCqFji6AD343xyAbfzRZRZ8k5hAevW2WF
         doPo1snjn6WhQbdVMBFUy9zd7FaiDFBS7r7kZXyFs/LL6NeQGKDnHoyjYFV+1ZNHPNzr
         DbxHTIwjvrHU3deMyAZw47X9yZscABeq+Edwx09G6O8Nv+ImRblHchZiy/m9fG1Z6nkq
         2GLo3K4YQRlQJu1M4qF22R0FrjgGaMRNfsCLN7kd42iXvYj+YxjjFhbY26ZfZ5vdz+Mb
         HdAQ==
X-Forwarded-Encrypted: i=1; AJvYcCXppmGOAs0T1gM9WfItjB1V6r38Ze0qPhGETBs5FOx0YouZQhD/pqsgzX20ZQzbaIUkuqhTs+C321k7QcwtFFM3oN0rJJ4FL499kA==
X-Gm-Message-State: AOJu0YzYqIM87rSGFn5M+rkJ4o8jSMth1Qo9aF2ugvg16S38xF7t3GSN
	tYhwTEX11pbhLTCkElVLZiLBP9/8eVP46OuaiSeOngF9OMxEyckRzUisbiDe7A4=
X-Google-Smtp-Source: AGHT+IHM11iunOezkbwlJ6llpbCd73typJc8ayn4aA7J2ThVxI6qP9TuoQTlv/MFoLDDWPt/JHPQDw==
X-Received: by 2002:a17:906:340f:b0:a51:d235:74cf with SMTP id c15-20020a170906340f00b00a51d23574cfmr4645187ejb.38.1712668322828;
        Tue, 09 Apr 2024 06:12:02 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id hg13-20020a1709072ccd00b00a4660b63502sm5774271ejc.12.2024.04.09.06.12.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Apr 2024 06:12:02 -0700 (PDT)
Date: Tue, 9 Apr 2024 16:11:58 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Jim Liu <jim.t90615@gmail.com>
Cc: JJLIU0@nuvoton.com, KWLIU@nuvoton.com, linus.walleij@linaro.org,
	brgl@bgdev.pl, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org
Subject: Re: [PATCH v1] gpio: nuvoton: Fix sgpio irq handle error
Message-ID: <b36fd94d-d5c7-40b6-bccf-d5c1f66c6373@moroto.mountain>
References: <20240409091419.1356615-1-JJLIU0@nuvoton.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240409091419.1356615-1-JJLIU0@nuvoton.com>

On Tue, Apr 09, 2024 at 05:14:19PM +0800, Jim Liu wrote:
> Remove irq_find_mapping and use generic_handle_domain_irq
> 

The subject says that it's a fix, but the commit message doesn't tell
us what the problem is.  And there is no fixes tag.

> Signed-off-by: Jim Liu <JJLIU0@nuvoton.com>

regards,
dan carpenter


