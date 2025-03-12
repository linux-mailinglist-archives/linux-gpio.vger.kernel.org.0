Return-Path: <linux-gpio+bounces-17471-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CE919A5D411
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Mar 2025 02:33:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5FB4D3A60D5
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Mar 2025 01:32:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38223288BA;
	Wed, 12 Mar 2025 01:33:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bSLn3ipt"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACCDE2F24;
	Wed, 12 Mar 2025 01:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741743184; cv=none; b=oayohCS2HxC5jwF2VXmp9Q3C48G8iSk0iTufYns/yjzIxpVbwIW+sSXFgUlj1oyYpAVcNtrdsFI46xaxbd77sHKWKFbTjTG+cU4HSqGx8JnaunHu90t2fWg+Khg9TJb/QLXOI4DJCFj5CN/cKYi4k2v9/HwAq+5EaXc23YxWddQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741743184; c=relaxed/simple;
	bh=4Nqdi/0VCHNIVz9BN8lkGJcdrKBXGtpua/GeXemw2Tk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m3LVVEyR3vE3mg1Ly2sB6fWezfIKriKJP8ubXP/DsHHlq/Y9qOMl3FuGo7rCvTqm1SqOXuPi+eNX8VPY1qvVV0r/Kw2liv87Le+6AiQkRbvTz9xf6FfwK6RzmwyFeOxe7eXlndPAPEEqe/6B22PBmPBmgGQ+RA67phDme0IxyyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bSLn3ipt; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-22337bc9ac3so118093245ad.1;
        Tue, 11 Mar 2025 18:33:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741743182; x=1742347982; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EkS88HqgPHnaSuKJ1PQxAF78tCiWoO+UmZZjeELikMQ=;
        b=bSLn3iptjDav3KyZT7ZSLTzkTEtKdPG4sbx4X3N064zYaJHjJLDl+yNiQzpWIfVDLf
         Pvm7rTuY7Y6fDK4F31otRiji+CXumWFsxTOIC9AspoKjlnUw6DExSevoK9e1LUx2bM1Q
         oLtVWWuuCtaxhm536pvjU4oG0iNZl6qzJbRByfy2ErccwotTXVcI/9CHohTkVJqDVygz
         7xN6uOp0gOxdZGQXJKVJmbl/CL6FkW+NocNX4C6NkyoCUwLJgCJapx/7JIePaTl9eXyw
         QthHm5MMWaOGJCg9FBCq5OKva+fgx1m7TEHfdI5b2AUHEYq09rRJBSIAKjjsfiQWiNp8
         R0lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741743182; x=1742347982;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EkS88HqgPHnaSuKJ1PQxAF78tCiWoO+UmZZjeELikMQ=;
        b=f2KXtP+5FKN6PGUHi46ddSJ1SIy1iXkn3iEcQDYLbwAr9tgqgzrBpfTRGS3jQcQRRF
         70VUMuu5Q6rRbYn3daJWWoogwVmkDfgA6ma+CqnQHYgmqN8Se3cEPuUx03ZAV5D58Qan
         Y5e8/Tg/dFEjyDOKY12sp3Xx7/D2Dd5a/7ENHm0aiM9pte1kQvy2uY50sxhu2WbaQgrb
         L1SaI38gJ/UH506D4Uz3t5gHgvpEpEjQ+droqUZ1PCKz60yp8RiUPcs3E69VrQIla7sj
         CXIyyBY167A0RzWkwT1FRL/rMoyASEmz3DWR61h7EsyBYuJ2EJ8PVlqIgc3hJXIZQanJ
         sXbg==
X-Forwarded-Encrypted: i=1; AJvYcCUTPseOJZEJtCRifCRFnx2b88auQfz4BT7knukeqykjBhElyyaNn6/TA/JX6l1dSJ6sjmQbdaZQooJN@vger.kernel.org, AJvYcCVkOpAv7AgiX+zXgvIyWdEtLR6k+8PjcyLxvNiSNKH4nfIdxjHkOvWyjAlXv0aTKrKwugOBNFhCsmpZ/WTy@vger.kernel.org
X-Gm-Message-State: AOJu0YyeMw73hvSw8scxBKTiR1mTDyI0IIHyMGqL1ENZqq7cpbIVhjaZ
	i0dm799Yd89R3M7Mh0y2yCznpGCLDcoOIjPBWWZfaSrSi1zwqNWpMfF/aTYH
X-Gm-Gg: ASbGncuiJnMGvFxf4fwZVO5A7+wmKu9v5YpFFoTbhyOPF7g8OC6HzuliGnUMER8btUh
	b4sXyhv3cAMM5PQYCjbQQg0jOPBQZLpS3i8tSX7DX7TQkwNw2TVJVMyJsAm49tyk1ik3UjKHTl7
	FJIjaYfpLIHf7DsmIK/tvcDVbSLFzBFTSCz4LRskt1VD4p1Q4IXlLueWTgL3p/dUraY/lpPlvYS
	0S+zlfi9dnZkJVZDY/7VoemH6tQLfwOKtcB9sJnmf9HbxbFxnV14LJSz7BYhoqnpbFA2ugnwh2p
	VrE2T1OieVwug9Wi7DSm5/5W8lwQ1Q2lktcrbPBHZ4W53o2L3BkLAoa/um9DsgrORHkBKJcg4Nq
	/63I=
X-Google-Smtp-Source: AGHT+IFXo/Rh6dVC/MDmpQKqWlNEYEzqY/2RqVyvK553LTqZxg767rMRqB9EAcmKmaQhF9KLC6uxww==
X-Received: by 2002:a05:6a00:1395:b0:736:476b:fcd3 with SMTP id d2e1a72fcca58-736eb8a2cfemr8241746b3a.24.1741743181876;
        Tue, 11 Mar 2025 18:33:01 -0700 (PDT)
Received: from rigel (27-32-83-166.static.tpgi.com.au. [27.32.83.166])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-736a80853d1sm10111562b3a.91.2025.03.11.18.32.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Mar 2025 18:33:01 -0700 (PDT)
Date: Wed, 12 Mar 2025 09:32:56 +0800
From: Kent Gibson <warthog618@gmail.com>
To: David Jander <david@protonic.nl>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: regression: gpiolib: switch the line state notifier to atomic
 unexpected impact on performance
Message-ID: <20250312013256.GB27058@rigel>
References: <20250311110034.53959031@erd003.prtnl>
 <CAMRc=MeWp=m1Bi_t_FCrxFOtiv3s8fSjiBjDk4pOB+_RuN=KGg@mail.gmail.com>
 <20250311120346.21ba086d@erd003.prtnl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250311120346.21ba086d@erd003.prtnl>

On Tue, Mar 11, 2025 at 12:03:46PM +0100, David Jander wrote:
>
>
> Indeed, it does. My application is written in python and uses the python gpiod
> module. Even in such an environment the impact is killing.
>

Interesting - the only reason I could think of for an application
requesting/releasing GPIOs at a high rate was it if was built on top of
the libgpiod tools and so was unable to hold the request fd.
Generally an application should request the lines it requires once and hold
them for the duration.  Similarly functions such as find_line() should be
performed once per line.
From a performance perspective, NOT having to re-request a line is
considerably faster than requesting it - even with Bart's fix.

Is there something unusual about your app that requires the lines be
released?

Cheers,
Kent.

