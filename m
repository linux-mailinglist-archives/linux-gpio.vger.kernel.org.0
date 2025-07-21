Return-Path: <linux-gpio+bounces-23570-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EA043B0BE0E
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Jul 2025 09:48:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B539C189DE4C
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Jul 2025 07:49:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7716A222590;
	Mon, 21 Jul 2025 07:48:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zIWhq3nk"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D686CDF49
	for <linux-gpio@vger.kernel.org>; Mon, 21 Jul 2025 07:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753084124; cv=none; b=QL2z38P+kpcsAGSbEsDI5snXopdlQxDr71DlXtg/TUOfIUY2b6A/JqsoPZ9YTB56MCFrMs569k53Q4O66s5xEwKR/6Y2WW2hJb+CKsl6Pf4+bLZlJ6eW9of5Ko+SYZj0FK8si3/c8cXvQ1MTZuBP/ytGSFI2iDy/Ea4SdVVLalY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753084124; c=relaxed/simple;
	bh=ztMopiLCjRw/wMOvrbPMx1UdGTtIJHC08Bw4fN87NlI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KOrUtI3njUPF10iBVqynpUyYBIHxgaO3d+oa6o0afs7iCWlQRXI4pAyvd2BiSDJxx/GtWOQWO1/CTx99mFeeQpFCK5uF/DW1qWqPkGKMjgoaTrB/OdCC7ERoN4gO37GZT2tE7DTaD86fYmshxeabsEz4ZP5eRMXbnEZHLRG2WR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zIWhq3nk; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-234bfe37cccso30184845ad.0
        for <linux-gpio@vger.kernel.org>; Mon, 21 Jul 2025 00:48:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753084119; x=1753688919; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nY47hS80AjD0DswcO0FWDU1wZtZ/+9s0RlEjdS2SPZw=;
        b=zIWhq3nkxvdft9+fuXwLIrKVnAJt8v4n1+Trd1wHaUXd0EYe4XURrdoXABXoyj4HbI
         J2jDw01uC3e7HGQJ0aZhC08j4JsaQDLpNS6kDCmQSzDu5PIq41P2v4Leb587ZlHkYOT/
         tNMuQ/8ZiRBd3EMwJFPBhpk9xWWvwn6lWCJJjZgXy8qHaC2gEEzGZRzAa5/pvtTao67t
         n7YikIFKNwi3FzM+dSNJsB3imdqCGPvotAIH0EyUs+rE+DnaKPcSDoDHtzhiTKGJZtwh
         tfc1afjguplY/V1nqxig/GGgfQygeWG75lp9eA6SxtbJpRKyJhXe5rJAI4ie+3brow9I
         q+mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753084119; x=1753688919;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nY47hS80AjD0DswcO0FWDU1wZtZ/+9s0RlEjdS2SPZw=;
        b=GKdpq4B70522DDo3wJ+tNcM16k0UPlbYhyw9wNsHDpTEBRj/HPuCpqWOzrsH1t8jQq
         ay3WRM89xJgHIvW+TqjvtPat7DsHQYNjHR67CtKkH8Eajvq/bSnrVNP0A9ig7XVN6ngF
         PnGdxkThi5L+yxNjAAUtDkoIVJhyassGpGF/8I7+Hs95nAuEKouWR7KXZH609I1yN2LD
         RFR/K5Pgp3VEQVckZLkCBAcQxpFL8ApTen6ut3oTBtwCBNuLT75Db5yw9KDLyjxW3zuv
         1siD6JOxEK9K99LhBM6BwvDUzeY2wNzoJgpYOvAeW8Z0Q8gGgEBTHDeo8jH5SjPJl6dc
         N/Jg==
X-Gm-Message-State: AOJu0Yzhab2zbBxbtsVYTG9JoIvtKgEvt/BxDAWxmmdQbFx8GVUNIdey
	zj7sQR4ZAuyvR1VRl7N4ikCzZAvOsO4N/GCuk0GwQL3TVoTwMFi7YQTv9tyyKmWz7xk=
X-Gm-Gg: ASbGncsEu9mRr4aS0kA/lE+a4PqP5KTH1OpRlfDBRHf9N3F+Q4Q3Vmbes1NQEpNHn6z
	qCz+NmlSxU9OWp1fFUptZrc8AhivgXo1REUkhMp595J1jQcp8LW/nI6NiPOtHS8t+oE32SCEzCE
	Wq8kdHioTz/Wawx3Oh0PgNS3xlyN3gzKzFGr1Nbl4r6FQ0wmVZ5NmxJYGpFcrL8DwKis4fxZDrz
	ka7aXm1dnZj2spDhXig5+tpfzR0FAROSgi8Zyxt85stt0byehbZNoamY98Dry5FX0Nv4oyXJfEz
	ri6IHOH+rxlP+2zk6uPZOa5p4Mckt76FAMr9yhdAH22y7ev17zenisiC4E0Ff80ujZ0RcJqB0O4
	QAouYqi6vYJpAiMo5TmddEFU=
X-Google-Smtp-Source: AGHT+IG0tXGloiQljT6LkOw/qN/myiKbf4Y6q1bWyOlFqPLfZqV6DG3m/Lr3P4l0+FLF3PI5SHDrDw==
X-Received: by 2002:a17:902:da8b:b0:235:ea0d:ae21 with SMTP id d9443c01a7336-23e3b84e12emr179028475ad.35.1753084119076;
        Mon, 21 Jul 2025 00:48:39 -0700 (PDT)
Received: from localhost ([122.172.81.72])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23e3b5e2d6fsm52479805ad.20.2025.07.21.00.48.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jul 2025 00:48:38 -0700 (PDT)
Date: Mon, 21 Jul 2025 13:18:35 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Erik Wierich <erik@riscstar.com>
Cc: Linux-GPIO <linux-gpio@vger.kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH libgpiod 0/2] bindings: rust: mark raw constructors as
 unsafe + rename to `from_raw`
Message-ID: <20250721074835.kzf7gphujqqgr73h@vireshk-i7>
References: <20250721-rust-unsafe-consistency-v1-0-aa1b42ed5983@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250721-rust-unsafe-consistency-v1-0-aa1b42ed5983@riscstar.com>

On 21-07-25, 09:41, Erik Wierich wrote:
> This is based on top of:
> https://lore.kernel.org/linux-gpio/20250720-new-with-settings-crate-v1-1-a51392bd5b13@linaro.org/
> 
> Signed-off-by: Erik Wierich <erik@riscstar.com>
> ---
> Erik Wierich (2):
>       bindings: rust: mark constructors that take raw pointers unsafe
>       bindings: rust: rename constructors that wrap raw objects to `from_raw`
> 
>  bindings/rust/libgpiod/src/chip.rs          | 10 ++++++++--
>  bindings/rust/libgpiod/src/info_event.rs    |  7 ++++++-
>  bindings/rust/libgpiod/src/line_config.rs   |  7 ++++++-
>  bindings/rust/libgpiod/src/line_request.rs  |  7 ++++++-
>  bindings/rust/libgpiod/src/line_settings.rs | 10 +++++++++-
>  5 files changed, 35 insertions(+), 6 deletions(-)

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh

