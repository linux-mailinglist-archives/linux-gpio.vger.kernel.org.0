Return-Path: <linux-gpio+bounces-1454-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 057EB812F65
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Dec 2023 12:50:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0BE3E1C218B7
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Dec 2023 11:50:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76771405D8;
	Thu, 14 Dec 2023 11:50:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fmv/m90x"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com [IPv6:2607:f8b0:4864:20::32a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F31C9113;
	Thu, 14 Dec 2023 03:50:49 -0800 (PST)
Received: by mail-ot1-x32a.google.com with SMTP id 46e09a7af769-6d9d209c9bbso6591312a34.0;
        Thu, 14 Dec 2023 03:50:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702554649; x=1703159449; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GKt11ljdbrQuqgwD8h0TcinNH0vRuCIxothOamPhbdc=;
        b=Fmv/m90xFqGeXgAIlW2erJMSrPKn16A/7lvl1myUBAQPbAkd2D9mVhsDABZOEHCXdE
         9KThEzikiHNpukc7Z0rg4E6Ijs6XymKkFVqqZYf21uEcrZWfQREdrGzqraeW1ayAYWTp
         8IxcCqYGWXeC8kzX9i07yx7FZpL9sqlyr2cLpj+Q2xkVHxaM+vDJ2kBYqI6ZoA24SAUF
         rieUZQU2FvmTMevfFjalXtKDUgp8cqeCTy66tXekQvyLZi/NKGNWrob2tkbt52+Bqyo7
         ZOrbLnhxua69LI3CF9lhjSYHGM9eL3Af+ELm61zIcsK5ELyAokQ4aPt3zR7mMA6IHEyg
         uf0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702554649; x=1703159449;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GKt11ljdbrQuqgwD8h0TcinNH0vRuCIxothOamPhbdc=;
        b=nzafL5yXNXu/6+1ymZPF6TeCCLDC+5q53W9NVSi/RtBDyA56BLd1eXaITdgkmC4giB
         +ZsZfoBnR3CLbnfRrovPqhtD5gfCNvFkdcfaazY9ASBrZjQnYOnqQ3t5SOzJPrNIfQQ/
         qIacHbwF+LdqsK6wFDHzvxoRCj6+4jyHwkds1fQpgxTOiJEnUsmqVogbE8wooWiW9Hlr
         422Oq1dVsbdaqJCH6Lcfeax4Bs/j7uIackY6+D2weNSK/lTGJY2AQamTFMxD1z+SXBKQ
         44+c+E1fcUIWshPZS9xrYK9h9MbHVUrhDyMg2iS8BtDp8YhOx4Lgios3c6FO0NufFMxj
         S9/Q==
X-Gm-Message-State: AOJu0YweQAiumQtVORO6+wHhe7Wm8twwvtz+eCglmQi2HuQ2TQ8UuPQf
	D5rEMOtT5k98izq5FevA0L4DCp7iVxo=
X-Google-Smtp-Source: AGHT+IF2ShbB/brNYRN/j5G4nliv7r6d/I3VA70v7aP6fSXTpF+5YgsBYMkeicLjBx7lC6K8RIjjVg==
X-Received: by 2002:a05:6830:1bdb:b0:6da:32cd:893a with SMTP id v27-20020a0568301bdb00b006da32cd893amr3466239ota.41.1702554649168;
        Thu, 14 Dec 2023 03:50:49 -0800 (PST)
Received: from rigel (60-241-235-125.tpgi.com.au. [60.241.235.125])
        by smtp.gmail.com with ESMTPSA id c7-20020a056a00008700b006ce458995f8sm11686994pfj.173.2023.12.14.03.50.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 03:50:48 -0800 (PST)
Date: Thu, 14 Dec 2023 19:50:44 +0800
From: Kent Gibson <warthog618@gmail.com>
To: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, brgl@bgdev.pl,
	linus.walleij@linaro.org, andy@kernel.org
Subject: Re: [PATCH v2 1/5] gpiolib: cdev: adopt scoped_guard()
Message-ID: <ZXrsFD2l5S5BXEHH@rigel>
References: <20231214095814.132400-1-warthog618@gmail.com>
 <20231214095814.132400-2-warthog618@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231214095814.132400-2-warthog618@gmail.com>

On Thu, Dec 14, 2023 at 05:58:10PM +0800, Kent Gibson wrote:
> Use scoped_guard for critical sections rather than distinct
> lock/unlock pairs.
>

It seems using guard() can further simplify cases where the scope extends
to the end of the function, so I'll replace those cases when I do v3.

Cheers,
Kent.

