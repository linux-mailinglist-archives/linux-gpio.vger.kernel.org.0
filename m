Return-Path: <linux-gpio+bounces-24485-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 605C9B29D16
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Aug 2025 11:05:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2BC1B2A376A
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Aug 2025 09:04:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B02DB30C358;
	Mon, 18 Aug 2025 09:03:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pElY1WMd"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B17053019B5
	for <linux-gpio@vger.kernel.org>; Mon, 18 Aug 2025 09:03:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755507839; cv=none; b=u5H8s0xwsrHIHPyrDVF3Na2OzFOD3hdZ8xnwgZhErSUgOaaoY+DUOQpxSKAqlVGb3DSqM3umHwBo7tSt1FjZdAlBNCVkgWftl/M9RDFpqHseyQW1/ExRdXMsh4jJV6BVoaonhbcfq98Y8JyxYSGuv1W6Wq0q7NCpMkJ+fcXBFlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755507839; c=relaxed/simple;
	bh=m7oOCkrHmV3m6RPZPr4H1kZpkhVJDtpouU7lgw2AWTc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TY1CjP1kBpdRInja2PQwcao6NsL/5I8TbwEvheEfl22UFPkcnSXfoKsDnTYWt6BFPcTRP3mH6JHDgn5UBddSThTvC0E1lY+JsMIfWR3SN4E5myiHxXSKdmT7yugT8SjC7GWwTPXc4l+AoBTKN6kl/OZNQKFpAPJvYk5hIEe7uIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pElY1WMd; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-333f9145edaso28758111fa.2
        for <linux-gpio@vger.kernel.org>; Mon, 18 Aug 2025 02:03:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755507836; x=1756112636; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MUwutcLP2TU0uZmoKGbkLCKDIFQshb+hzWxBL6xH0Wo=;
        b=pElY1WMdiB++dh7NcmzagwkoI7mcFzY1I5dMWBqyA74scurUnPnVCBpWlge9xN7r2Y
         GbCmLLf59Qbq9KYtbJfDwfURG2UQtdmlnKRNDPiLyQm2aB4lwdkga2Y7ZxWfgWZbkq0D
         jYrmFaHxLjC0U+4S8za1xhieRKgwsMsUhucn5UO8YTLH0eNGt1JokHvnwirDp4FQ1+BA
         PVUywFNWm1iL538hLXH1fH7CceBAWlZLYTOAKCQ/0NtjSFzZ7qOGIqS/2UDgHXzDspqU
         itPJPX47k8tgj061buRoHYP8QejjKWsTUsix4cqmen9M7CiC7NOfm6hjzE7r2teVT7eo
         YAFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755507836; x=1756112636;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MUwutcLP2TU0uZmoKGbkLCKDIFQshb+hzWxBL6xH0Wo=;
        b=kWsFJBP+/WS/hOTJ6I4zuUSpPE4QE8WxnZfOMNPWFRzxE/aubKjbxY10LKeGsbHBqC
         Zm2LOI+09xK90gBmzCUlAzzFLOLv6eU0fQ2F5QUcFqYSCXCSX3sJz8GMcTrZPHzHIPMj
         IRW6YF4nDZ6UP0tFPUxRum6ts5sZz8m7g74LT3qVrkc6claP17UpQIHZDq16nU+cy0QQ
         akUqA3b3x59DhLMUUwiZ4v9iD3OJaYPt561bF6P9Ft0PuXZOiRdDG5wqc2fCyNs5qi5A
         ycdFyblP9V8ha4rqkNvF7x5RaVszl1ymexZhsa+u3WVUXq1srcEDZ6fkQSCBB8bjDOWV
         VHSw==
X-Forwarded-Encrypted: i=1; AJvYcCXOmWpNE4aRKAcZyPLvtEqB/tL6ls7QsjmCdLTqD1XPXJyUopIh2aiMgdiRHVND9Dp8qHnyS5zIHdYD@vger.kernel.org
X-Gm-Message-State: AOJu0YzhQiSi33f+CoZVGFO6nwmsBYYJ0AC/ElaPhn0ew5wAT8H0z/tV
	uvBHNxlV55wSfEOTmV9c8F5QyBs8lEjVe9Gg70MO1FA7ZfB+g1nnOv0lvRBTRI1PTCL0FqYM0sU
	yoqLaM4MoQPbRB1sWwt/+8mjGYSN7oW89p04xJATnvw==
X-Gm-Gg: ASbGncuGa8Z+yYwqfM8IqbonnEv8T2b9byIg107iz9zvQV9XDTFZB7ewuEWI7uY9pI6
	W8GOeNDLWWiU6W4Dt6nYJrttYKmAOCjl6QjNfAYTobKL/1EJ4WC5WDrQChZbzTDH9F6nOBr4esE
	vFRfXlS+2VvV1aTh2YXMgHN8D2iILKa/sV/Z2R+xXVE/efJPxSdGTuG9IHoAWxHbS3E8j++jsK5
	HJ7j/W3PzlCcDAEdw==
X-Google-Smtp-Source: AGHT+IE9kamzF6h6Mj0Uthfqb51rMDCl6ApaA6r9yCxNefG5kg1EpxapoTSKZbjphVliY5NG5jt71S1DTJFc+QzXeWM=
X-Received: by 2002:a2e:be21:0:b0:333:bf9e:d75a with SMTP id
 38308e7fff4ca-33409809840mr30484411fa.6.1755507835692; Mon, 18 Aug 2025
 02:03:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1753039612.git.dan.carpenter@linaro.org>
In-Reply-To: <cover.1753039612.git.dan.carpenter@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 18 Aug 2025 11:03:43 +0200
X-Gm-Features: Ac12FXwmdSMJ2XrjVzm-k9jfEa6zy3nIx6AoVfYXMCJMow6Cz5Q3z1FJ4deDBS0
Message-ID: <CACRpkdapzTTJhAvY1BL8GnUpCc_iHESbY9bFsNTE4Z6FjusiJw@mail.gmail.com>
Subject: Re: [PATCH RFC v2 0/7] pinctrl-scmi: Add GPIO support
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: AKASHI Takahiro <takahiro.akashi@linaro.org>, Michal Simek <michal.simek@amd.com>, 
	arm-scmi@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Cristian Marussi <cristian.marussi@arm.com>, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Sudeep Holla <sudeep.holla@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 20, 2025 at 9:38=E2=80=AFPM Dan Carpenter <dan.carpenter@linaro=
.org> wrote:

> This is version 2 of the RFC.  The main reason I'm sending this is becaus=
e
> there was a bug in the first version where it didn't calculate the offset
> correctly so pins and groups weren't linked correctly.

I'm thinking of applying patches 4, 5 and 7 of this patch set to get
some movement in the code upstream and make less work for you
to rebase the thing, would this be OK?

Yours,
Linus Walleij

