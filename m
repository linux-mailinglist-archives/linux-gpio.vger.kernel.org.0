Return-Path: <linux-gpio+bounces-27609-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 69C89C0A06C
	for <lists+linux-gpio@lfdr.de>; Sat, 25 Oct 2025 23:29:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 54D711A658C7
	for <lists+linux-gpio@lfdr.de>; Sat, 25 Oct 2025 21:29:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20A6F28D8ED;
	Sat, 25 Oct 2025 21:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P4NujWDt"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E006A259CA5
	for <linux-gpio@vger.kernel.org>; Sat, 25 Oct 2025 21:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761427759; cv=none; b=pbsG75z+G/3XCKATHwZOeJmD96aLYxoDRG1EoaWQoZOnoXsrZgcYzWLymwtdZp0GB3q9yw39YjmWxUkzAX/ybZBm+Uo1LQ7PGuMbsaZq4KA/dR/wA2EqrY/p5ejENcV0BaVAwl29J2WktmEjNkqIiUDtsMLv9qto667/RJlmVFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761427759; c=relaxed/simple;
	bh=MmMICD0aG5zYZqdyrqj3OoNO5kVn/Kex+T/2Hpjw7YY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AIg060a9ZER8ShH3x+5a4PWpE05d57KOnrJ5OKW7eYJUwzZ/9mrVirk/Fpiii92ATdspb0gW5pCN/hGHKt93uW4SbBKMclj61zf/MAVC02+re46ltT7Iltu/tOKPSq4Id4nA3SKEvNNZaBnvmxYT+D84G91hVE6BVU1LwR5LYYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P4NujWDt; arc=none smtp.client-ip=209.85.221.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f67.google.com with SMTP id ffacd0b85a97d-427091cd4fdso1957669f8f.1
        for <linux-gpio@vger.kernel.org>; Sat, 25 Oct 2025 14:29:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761427755; x=1762032555; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Tiad/+1cEvbbx15ctckUrIUdNeCP0XY3zN8XtK7zXJ4=;
        b=P4NujWDtttW+YbfhbKYygjWazHF+f8LSGKE6jI69DUfWCg2aq4/FcED+qlrn5F3CIx
         79XUwJNrwuj4EiNgn1b1GFLcLzLaLIbLIY7MVKrAFDd78nxy46I99BsWnezB8GHXyPw+
         wOIMaZriBNWfyKo9zpkztPgNXHhcQB0LQ+lFJXZUXmHjfc9IugqGHqg/x2msh0YU+Cop
         alt+KQyNXrCmQBqjviMdnrlwgwiE3HbCqwHI0ZfnFlqujezNhjsV5xWZ5UUoM63DiLa4
         Ed8i21XHEA1+iLww9n9Lc52kZN9Xu44WE0cah0UGkAiLCeWVOE97a03Oi266rUzvu683
         cP3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761427755; x=1762032555;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Tiad/+1cEvbbx15ctckUrIUdNeCP0XY3zN8XtK7zXJ4=;
        b=tmj7C039kVAPXGfA53fOpSO0XFtN4zEZShCyECZt8j91g8XFYmmbrTzb/fRB7ii4nk
         Yi16nL+5r0u9fmh06UxSKQnVERWPpArjTSK6QnwqNTkaw/81TsQuVPq38+QXGk3nssWm
         OdZibZhPy6E8u3kUAGT7NPwvfexM8sMhi4vNIIbFZX7hczsrlrguOaWr4Mh6VwbnJkcu
         iSUMk4/WCxwQBJR7Cy0nbWuwspLMluL291uhZu2pn6pGMvTIR/TJH3v2SI9kddWmeZ84
         dakmnQncNVAkaXumuZ50g6H0WfKtnUsJSGQ8taxhTwptano0GKFGALu8wGsOAZYRPBSl
         gVig==
X-Forwarded-Encrypted: i=1; AJvYcCUzFAnxA3Ej+MMZKYTja0cewXsiqx0VOwkoI4vm4GmYAlLxz93wBsHUIQfbW1C+7NBMnRBM4FOg7/hZ@vger.kernel.org
X-Gm-Message-State: AOJu0YwNagm4vOjmKgvPFanLuVbTjWQgb7fERaE1hetQxVSk8oLSaykH
	n4ZRL/XaQxhstVrJfPUwVtNfezYfq2CZL6havW2ugC3YnFwdARXMyuvr
X-Gm-Gg: ASbGncuybz1l4tNEAbYkJc2cy8x2lQ1rpRkoV5AsPIZUsKAz/JEoNB09jRlg3Ph5BLb
	/Exdi2SCQyQDgETZEbkY7+ByNhR3ZSIay3XXdMHhcy3u0lSn8Hh8dpRkzCmc9NnCEpTZBRtIBiW
	beWYIfyZM/CUghEcrPZA77s9mzzkq20tj8wTMMxwmmCViSnqXu8NzrtcWSeDrN3U0UrHP7NK7SD
	zXGmQ5iblv1g26px7xfak6KhcO0ZFD3YjCb5HsIYjn7ArLMYTGq7zwVb093lEIvJzHrfqDM43wx
	kXWwbdDMOWAowAvY8k8/ovTRIT9AR+hE03wmLQmhS5RhfKBfCE7/dQxJGJSkFgSwHNKfWDGlQnr
	DC7g1Pa+ZDZdSXb0Eej5o2ixxJjHhQ45TjuKBd2i/Kj4lWI0M8Z7QHobg7fh2P0e3XdBL6H6YmZ
	SESzeyI18=
X-Google-Smtp-Source: AGHT+IFR9xPlXCmUBASW/ik5a6VeudIrPkWWyQ4aeDva1FfLdoVVStcvOXzPLBYNJFCvHVp+roFOgQ==
X-Received: by 2002:a05:6000:1a8c:b0:428:55c3:ced6 with SMTP id ffacd0b85a97d-42855c3d3f3mr10555869f8f.18.1761427754791;
        Sat, 25 Oct 2025 14:29:14 -0700 (PDT)
Received: from [192.168.10.22] ([39.46.217.86])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952e3201sm5395009f8f.47.2025.10.25.14.29.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 25 Oct 2025 14:29:14 -0700 (PDT)
Message-ID: <0881d989-c1f7-484f-a5e6-aee47ee5c5d6@gmail.com>
Date: Sun, 26 Oct 2025 02:29:11 +0500
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] pinctrl: starfive: use dynamic GPIO base allocation
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: hal.feng@starfivetech.com, linus.walleij@linaro.org,
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 Bartosz Golaszewski <brgl@bgdev.pl>
References: <CANBLGcygpsp=R5gM7NeuVO-JG1yfQJ_0dhnFfL1ud=291cJZAQ@mail.gmail.com>
 <20251024143353.71753-1-alitariq45892@gmail.com>
 <CAJM55Z-SrU1Mk4xUZTgey-zArYAvtpftTwGBb_VEb0zL3L1EPw@mail.gmail.com>
Content-Language: en-US
From: Ali Tariq <alitariq45892@gmail.com>
In-Reply-To: <CAJM55Z-SrU1Mk4xUZTgey-zArYAvtpftTwGBb_VEb0zL3L1EPw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Emil,

Thanks for the review and feedback.

Quoting Emil Renner Berthing:
 > 1) The justification for why this is no longer needed should be in 
the commit
 > message, and not just in a random thread that will soon be forgotten.

My apologies for the confusion. I did add the removal of unused 
variables as a bullet point in the v2 changelog (which is in the email 
body), but I failed to include the necessary justification for this 
removal in the main commit message itself.

You are correct, the justification for removing `gc_base` and associated 
macros (because we now use `sfp->gc.base = -1` for dynamic allocation) 
belongs in the permanent commit message.

I will update the v2 commit message to clearly state the removal of 
macros and unused definitions (before "Signed-off-by") in the v3 submission.

Quoting Emil Renner Berthing:
 > 2) Please don't send new revisions as replies. Start a new mail thread.

Understood. I will send the next revision as a new thread.

Quoting Emil Renner Berthing:
 > The code changes look good though, so once that is fixed you can add
 >
 > Reviewed-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>

Understood. I will include your Reviewed-by tag in the v3 patch.

Thanks again for the review!

-Ali

