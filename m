Return-Path: <linux-gpio+bounces-13304-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E53B29DA066
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Nov 2024 02:37:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A9137284C8C
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Nov 2024 01:37:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7744F156CF;
	Wed, 27 Nov 2024 01:37:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d2A+QdO7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE647C8CE;
	Wed, 27 Nov 2024 01:37:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732671451; cv=none; b=gPdX7Rha6geYdP2RPHMdQq7/iIl+kav83lqhz/Pm9LWuBC2XFpSZJkNOzwBPjz2bkeUOMV84ur0ywdCz5UzDrs7t2F4SSwqnFOrrlx8FYolKFywf+BzLD5IP3/FkNX59I9URqbXukz9xCGsFHkYdFFIE2LhPN0qIowlADi3Cu0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732671451; c=relaxed/simple;
	bh=0umyFcerexjKmLDzggYDpIz5swwz0Q+pMktbEYfhU+U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uPRX64Uv5YGFNFedrqT+yDgTLquGKny7wde2jRRfQcNxpkPHq314BztOuhmzXfBdWe/jE9MsNi2WfYL6t7J3HNyVeTsKvdUvllbcnn7M7Xu5H12AUOZRrjJLHAht9LfLRVnPVodrfm1IW6VIXAkYeV65ffWePgBgrT3eHSkIyEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d2A+QdO7; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-21269c8df64so63750015ad.2;
        Tue, 26 Nov 2024 17:37:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732671449; x=1733276249; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/1oDHVSede/fQ8LlstNUnurq3L2xH0lbxlrYxULSnqw=;
        b=d2A+QdO7eXHkHBt3P9FkKu643M9mf9x2wduQoKXhaIx56/rmYCvFTgS7tp0tVgVmHY
         S37l/SIFA63XFf0OQyMbjWnoDy51jsJQ/C44h1VRmY7rHIb2MSxIwivLsRoTU67kM0PT
         4L/FWIbfjNPQGY8sRu2ARED+Cn7oq2SRv8/BCp37TxB/+s4u8P857WzRennGrd3+1w50
         OBccy1n85ZV1ZlHKyjjyylIyFWKQdZ+ciLhCDWUXxmxzdT6hQfaD130TSEO7TjLcZE5U
         rO8uWJjBF/o2kTB7s4a2wkLDYVusqScRSzgq7d/ADQ9jLvw/iHnV4vOyVmv6N9Y8SndS
         GImA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732671449; x=1733276249;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/1oDHVSede/fQ8LlstNUnurq3L2xH0lbxlrYxULSnqw=;
        b=nf9v8rc/g/wSGzBYznnrSIAyYX5lQ0q1qmk+u/4GP4z74SP08WdsxIyI4/GilpC9pw
         PS3Q5DYrWfAsynsgj7YTEB8a3VXPDiqrPJ+M5HiwSmf7XYa6dBr6XvhPCqZAeUEVcNMO
         QCwJwHDlZXa7Pc/Ei1MN7bKj8fv4afoVlp4PHcjJ1WhTI8vWjPRQy+Y36Pad14GLjOp1
         AXqO+1ruroo7brg5F0+z9aGxBUHACHcBulzpcUy574d2/BjvY7zBxvpwp7/5Qq9Vegr5
         t/0CfdbzlW4mAFtmgnonhBF98Mmu284j3f72B4xRfmLVRVhPg0ZejVqVFfGtSozCteej
         OJ3g==
X-Forwarded-Encrypted: i=1; AJvYcCUSjnx5ttNSpXwyIq9PfFgHW3loeDl6ijcIx4oimqN7na9nwweqFKmyMbrZpP8XaRrPWr/Ch89cL6BHgpuM@vger.kernel.org, AJvYcCXE7/41Hrb4J8Hn86JSfF4mOq4EOSHK2EtZ5RPbAS4+a/vTnxpnvFsrfqr3IMLp0eysPN+eIa3/iAEBY1E=@vger.kernel.org, AJvYcCXQQJMMiuDC0mYUrQjWcnLZXPbQ8h1xJ6hR4t9EdJwXs301/yFZlR6TcZP9k2Cbh7c/1fqua3ZT8v8wIIk=@vger.kernel.org, AJvYcCXrBR/YiaZD8/5hA4j2DMlruzH7Som8l0c7fKgTQoDSU5mGdscjtQupECwor7JvamQCe2yANlvd0ftT@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7fS5wbhrpEMujludVdeKZDnNU6g31B+SgnOJPhhjpwlcku8ny
	So70+eH+mqhGhP8wL55RWAMhUWpiyVFO4vG8sdWYa9gowvDSgEuL
X-Gm-Gg: ASbGncv7NrGPzn7deXEioyBBYTulo4bohWMHFK8r3C6gu9yW1ndertzRIEVA0MUtAl/
	bk5Gr2P8bB9ybkW3s+oCH6iG2m5b+p6mbKu0tYcgmRPYoJsKMYaenX2Uv879Lt1KugR/vh0WYUS
	DiaoGgFzsGvFPh5baT9S0/zteOV/kcvQl7Si2mkb69XLbxQ42kztQ1C2a7q1HOHGgtrP69c3BmE
	coaEEsdiorwtnB0zz4pQ13DHcfRnX3FP1AJjWyZaqXWVwzzZaE=
X-Google-Smtp-Source: AGHT+IEePI5YZF2JkuuG4Z+TQhYRGoYfz9jRN2J/K8oMhEo8fWjSRzat20YXGpZhb8SvqAk8HhTL5w==
X-Received: by 2002:a17:902:e844:b0:210:fce4:11ec with SMTP id d9443c01a7336-21501086144mr17735635ad.1.1732671449173;
        Tue, 26 Nov 2024 17:37:29 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:d991:bacb:df39:9ecd])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2129dc16ec8sm91191135ad.218.2024.11.26.17.37.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Nov 2024 17:37:28 -0800 (PST)
Date: Tue, 26 Nov 2024 17:37:26 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Raag Jadav <raag.jadav@intel.com>, gregkh@linuxfoundation.org,
	linus.walleij@linaro.org, mika.westerberg@linux.intel.com,
	broonie@kernel.org, pierre-louis.bossart@linux.dev,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH v2 0/6] Introduce devm_kmemdup_array() helper
Message-ID: <Z0Z31lJ7N66PLLXn@google.com>
References: <20241126172240.6044-1-raag.jadav@intel.com>
 <Z0ZOUkDiBhKNK8E6@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z0ZOUkDiBhKNK8E6@smile.fi.intel.com>

On Wed, Nov 27, 2024 at 12:40:18AM +0200, Andy Shevchenko wrote:
> On Tue, Nov 26, 2024 at 10:52:34PM +0530, Raag Jadav wrote:
> > This series introduces a more robust and cleaner devm_kmemdup_array()
> > helper and uses it across drivers.
> 
> 
> I believe the best is to route this via Intel pin control tree, but we need
> an Ack from Greg and Dmitry. Or share your vision on this.

Sounds good to me.

Thanks.

-- 
Dmitry

