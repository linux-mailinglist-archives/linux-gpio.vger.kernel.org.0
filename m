Return-Path: <linux-gpio+bounces-25568-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BCEDB4363F
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Sep 2025 10:49:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1911E1B21ECF
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Sep 2025 08:49:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C0582C3757;
	Thu,  4 Sep 2025 08:49:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FNG+gAH7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9DAD2264B1
	for <linux-gpio@vger.kernel.org>; Thu,  4 Sep 2025 08:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756975765; cv=none; b=N41VQRui9gpuTVLxgVqkH051h83zog8EkLDsQq84JMb/0Y+sgjCN5lByiK3tCvLBEnn+kg4/6G3sZ0P3+rFBUIlnfE370K3DwAdBkjJYCHy54TnZbtOu172HoHB+1fXmyfcWei+PPyyMFrgBM6TqX+tyEUgP28uBkHjJskIoRc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756975765; c=relaxed/simple;
	bh=FptIsGmqRbieFIdHGIh7ZvUvDOvc+p/QvsVq7Yc63QU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ssF7SvGAFCXG25xgRVFB21vgUc0AOvQaJOLLF7djedKc8hxmjTfQO2J9Qwht4UrMSeF9XHRxo2XMZzNEpsRdE/aTJD6A094+cpLn0ELsMSg5YCnWrALJ0R/OJsxKbhcFxF62XOYuM6bUo1EwDsyDPPQ4eeAKX94t5jUscqK5fbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FNG+gAH7; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-45b7722ea37so3323585e9.1
        for <linux-gpio@vger.kernel.org>; Thu, 04 Sep 2025 01:49:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756975762; x=1757580562; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UbFxI1nbUxvYttiFTOIOkRfkrktqt/DTjxu5fMg4KBU=;
        b=FNG+gAH7YxbXJCwO2DUDx2N7MCf5Y9lSptBbbK5OXsehhp8k32Noo9fQnoWdGN5wNL
         kq0sJM0DYVWaqpLQWmlygc7hGPtJ1+oCPXa37rm1+ybZYMlwZUWUNgcyCLTz0GAUUDlF
         HE3ZUWr8cDx6JE7VoH8E5rXvhyR1lHjDJnmK0gV7qIcqImsRbw4oZWacKiSRHAu8iDGE
         Bf71udxbuI6bcyc/2qOrDcfdt2lAwUZEHyd7AXKX7a22ZJolF1MCYhw5gzCl8hTYND/T
         wkjeso8wQAerizC6Ay6q7C/3k4jksnZzqsxgPnsOjz8ltGAUJrt+cve9az/TmFM94r8P
         QuRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756975762; x=1757580562;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UbFxI1nbUxvYttiFTOIOkRfkrktqt/DTjxu5fMg4KBU=;
        b=BR+rxFSAbe8NG597JjHnTf7nWTv1FNk/03Hx78e5POyNO8BLVzCeUU8bcekggSuJVw
         ZeYaOH4ceihhX3foiqelgApnM7fKAgNSh/VRsddn+sdMy3RkDvkyKtepbhJSG8fJJzyA
         6hYn0UtX5ThkPxWIGHWtC8mbkwv/c+utNGVFbQvjPG/tieUKb679C5GNJicvt67Oa7zB
         De4ap+aSL6QijrFB5Iz5s6xaVOtQ2eaHuDI3xtvL4AGCOCX8301TDck+yYuo/7YJJEpG
         ppVoFJDn/WFZEBjd4bxv/Z9riAdN8u+M5dmTZ/MWmANz55dlzsgk5pB+zKoVXTaLHjZP
         Wpuw==
X-Forwarded-Encrypted: i=1; AJvYcCWl4KuAbzPdexez6LOTm7+evn5eFdbcwBASRQ03jzIRfAX/4Q+9bjVhqUUCUMfeKSQkIpHqNQ4kfp7L@vger.kernel.org
X-Gm-Message-State: AOJu0YwbFLvjUsREp/0gXmUBK8r+ZVPj8Zo8bfeg29H+FDjY+GJCjNyP
	uW01Lxnr5XS3pt9JJhIPfqmYjzJBSWvRdoPOaomQqpZJnjWW15ghYsPguZkidYeEk5g=
X-Gm-Gg: ASbGncspztccm8CmGKmm8xQIjnmclEyfA0VFGUqf7iuN9oXyPN1vh1FKZoZEmxncz/x
	oegwc4/NX1oMcgnaSrhkpKLqTJxjCeFg4MLafJCBVrGEB1I40S+5lZCy9aoGo7EAbXFP5RAY36d
	NvT2mTq7gwqOFRbBq7SKytd8WGIaQ8RkycJUlUPTPe1PJ1Qe5QKmx1X2CbWCZeanMKDBmPkERBI
	+UIacmG2e/Dk7LzNsKzj1e0OYbJlkSQ/Pn72ZOy2bHbEwneiwiqWujTm9Rgb9kiX94Lvj5V+GOG
	fuXuKY+vc6clKdZA0cuo7ka+5zt//V8o4/0fbkUaNME/Sha+Vu16hV015DzE4sthIJyEJgBnj2M
	yke+DepCyOtkYlBB67KuDbbVMaz00X4La9AK4jQ==
X-Google-Smtp-Source: AGHT+IEXzX+ko/VujNgyg1NkhNKGRrpRh4vT/RECxhIyLp2Rrc+Ao5e4p7lcyFLqt6liOn/R8Fm6cA==
X-Received: by 2002:a05:600c:1f06:b0:45c:b6d3:a11d with SMTP id 5b1f17b1804b1-45cb6d3a1aamr38609495e9.1.1756975761979;
        Thu, 04 Sep 2025 01:49:21 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45dd0754597sm12220685e9.11.2025.09.04.01.49.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 01:49:21 -0700 (PDT)
Date: Thu, 4 Sep 2025 11:49:17 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: AKASHI Takahiro <takahiro.akashi@linaro.org>,
	Michal Simek <michal.simek@amd.com>, arm-scmi@vger.kernel.org,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Cristian Marussi <cristian.marussi@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, Sudeep Holla <sudeep.holla@arm.com>
Subject: Re: [PATCH RFC v2 0/7] pinctrl-scmi: Add GPIO support
Message-ID: <aLlSjZX_l8ifxL_h@stanley.mountain>
References: <cover.1753039612.git.dan.carpenter@linaro.org>
 <CACRpkdapzTTJhAvY1BL8GnUpCc_iHESbY9bFsNTE4Z6FjusiJw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACRpkdapzTTJhAvY1BL8GnUpCc_iHESbY9bFsNTE4Z6FjusiJw@mail.gmail.com>

On Mon, Aug 18, 2025 at 11:03:43AM +0200, Linus Walleij wrote:
> On Sun, Jul 20, 2025 at 9:38 PM Dan Carpenter <dan.carpenter@linaro.org> wrote:
> 
> > This is version 2 of the RFC.  The main reason I'm sending this is because
> > there was a bug in the first version where it didn't calculate the offset
> > correctly so pins and groups weren't linked correctly.
> 
> I'm thinking of applying patches 4, 5 and 7 of this patch set to get
> some movement in the code upstream and make less work for you
> to rebase the thing, would this be OK?

I think we need to hold of on 5.  I think patch 5 is the right thing, but
I need to make sure that it doesn't break anything.  I was hoping people
who care about it would let me know.

Applying patch 1 is pretty easy as well.  We could do that too.

Sorry for the delayed response.

regards,
dan carpenter

