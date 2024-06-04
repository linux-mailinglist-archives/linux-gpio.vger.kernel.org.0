Return-Path: <linux-gpio+bounces-7142-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 220C38FBEED
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Jun 2024 00:29:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A598A1F234ED
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Jun 2024 22:29:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8425E14C582;
	Tue,  4 Jun 2024 22:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GhTx2NJv"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF56314B94E
	for <linux-gpio@vger.kernel.org>; Tue,  4 Jun 2024 22:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717540146; cv=none; b=Zxh9GXow/55yGWZmUCkrxZkWd92OgQ+l1XcxSftqdumzhoJzVy5GnA1ka4/k5DbIk+DcesDLSv37UV+6LkZKglH2QhUrVN+6WYKft5fWWnY2Q7npTWgXcuDs3ynen15yF0B8JcrDKfJI8QnKY/kVwb9d4bYXFml2Ssgk66a/90Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717540146; c=relaxed/simple;
	bh=nx2U8+cqFzw+k3imNUQe4LGSok47qWtoyLXmyh+azww=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=r70GQMxp0a41E2G6Advjs7d6VvJbVzhf8iG6tjmVu2y9ZzYfepUliblTBrKn+N7jl5F/aC50jFaLu2ohuPRRjwN0qlA0yNKHN758cAUQpNGI5GoFLjrqXmuNO2HDFDqBg/yaap1Fh5KJ8pMDXHgmGupEh6BlpMq6at1KNPKNmBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GhTx2NJv; arc=none smtp.client-ip=209.85.210.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-6f93c24d1f7so687792a34.1
        for <linux-gpio@vger.kernel.org>; Tue, 04 Jun 2024 15:29:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717540144; x=1718144944; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:disposition-notification-to
         :from:content-language:references:cc:to:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PgVwvKnTjTv5uy/pHMakxpXBMYi+LmINSc5wBvAlDm0=;
        b=GhTx2NJvZhiyjwiP9+je0UPpK5sRxr/uCH9N7wdJY0vIWx78GOG/0+cchBfY74psob
         KHQXio9WqvVB9oFHNnPkrnZEfweIPUUrZAtyCykaaWPrfcRbRRo7UDb73IHuoc7zmRVw
         /5JcjiGt6wr7RyL3O6QaoMEMltuXtn9Js7Urj4gRwgHKEXp+qIR99xPOSU8vL+hPDmez
         DbE0YuhXGMqhqinDuRTMsZdWdOdGO1trCpHfjpArlj9yRj4mCuGRat1qEAUJDb5H81uV
         tGMHrsxreFlyzj9KEN0zewKa4VDcCMPQiCPWiZP3fgFQTJN7bphxJ5fTv5KfulDPuLUU
         x/sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717540144; x=1718144944;
        h=content-transfer-encoding:in-reply-to:disposition-notification-to
         :from:content-language:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=PgVwvKnTjTv5uy/pHMakxpXBMYi+LmINSc5wBvAlDm0=;
        b=JUHxbVzd5Qqpms0zlv+6xPu/wQe80SwuF3r9+xApal8hAYc5oRCK9GVDJFKU7Oil21
         8B4Z12hRDmI3inWyVcGMwSVjYfz0PF3P99MyFzSio2Qkeb/sCLesjQlWFHaCnOnFkNU6
         EgTz6DFjdbuipUI94qCL6/FIphhDoHAvUoL8hqbDhZSiqealqrg3EVnTfmptCwyGIX/G
         P0T3FBT2l2aVA2AKLV3wIrDGM74zfnb1kzOa5A5jMpfM2danHWorqTQxeCozgPeXDDE5
         RDsvZ7UoQJjtKsPlla2OsuSy4e9iKqHY19UQ6zXIBGFeWQSGUqm1+ty62bPaEFznS+RK
         7edg==
X-Gm-Message-State: AOJu0YxXsAscL4wFf+Mlttuk3ESJ8SoKu85/NWBqYUhrpXDkIsBKMAWw
	No/xsgvWAq6RWWir59cSYZrsymW2rQRWevs2g/Zo6+19xnxU7KKNo1ttpg==
X-Google-Smtp-Source: AGHT+IEJ0x9HA1k9zLZ8ZfRq17CI5w7KY8Ihx2zmxl2IveK92m0281vFtzTtXXjK5DCBhAUpLAlJWA==
X-Received: by 2002:a9d:6210:0:b0:6f0:3b33:62cb with SMTP id 46e09a7af769-6f94343f120mr916063a34.13.1717540143983;
        Tue, 04 Jun 2024 15:29:03 -0700 (PDT)
Received: from [192.168.6.104] (mail.3111skyline.com. [66.76.46.195])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-6f9105a9f1fsm2114052a34.73.2024.06.04.15.29.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Jun 2024 15:29:03 -0700 (PDT)
Message-ID: <3daa83c6-3f73-4cd0-9e57-a84333e5e666@gmail.com>
Date: Tue, 4 Jun 2024 17:29:02 -0500
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Documentation for line_config PULL_UP, effect on line_event edges
 and line_request values?
To: Kent Gibson <warthog618@gmail.com>
Cc: linux-gpio@vger.kernel.org
References: <d82c276f-fade-4b23-9617-206c4cf0796e@gmail.com>
 <20240604024322.GA45268@rigel>
 <2b815f80-5bc1-499c-9f7c-38749e112269@gmail.com>
 <20240604125241.GA295468@rigel>
Content-Language: en-US
From: "David C. Rankin" <drankinatty@gmail.com>
Disposition-Notification-To: "David C. Rankin" <drankinatty@gmail.com>
In-Reply-To: <20240604125241.GA295468@rigel>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/4/24 07:52, Kent Gibson wrote:
> Thanks for the feedback.
> 
> Oh, and are you ok with me adding you as suggesting the patch?
> 

That is well above my pay-grade in the kernel world. A patch sounds great, but 
I'll leave it in your capable hands how to do it. I'm just thankful that the 
little extra addition to the documentation can make all the difference in 
helping the "I got it!" light-bulb wink on for new users coming to the interface.

I know it will help given the threads on the Pi forum I've participated in. 
With the added benefit of helping the 3rd party libraries move from the V1 ABI 
to V2 more easily (e.g. wiringpi, etc..)

Let me know if you need anything else, otherwise, thank you again for your 
reply and help here.

-- 
David C. Rankin, J.D.,P.E.


