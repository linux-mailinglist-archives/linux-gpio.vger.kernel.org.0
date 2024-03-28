Return-Path: <linux-gpio+bounces-4810-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B5C0F890E39
	for <lists+linux-gpio@lfdr.de>; Fri, 29 Mar 2024 00:05:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1C3BDB2236C
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Mar 2024 23:05:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C82C5381D;
	Thu, 28 Mar 2024 23:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ET4LfCM7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9DD527446
	for <linux-gpio@vger.kernel.org>; Thu, 28 Mar 2024 23:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711667136; cv=none; b=Nd8CS/Q83P79VfDaEZAXmJEVXPXL3aFdt0UjTW7I0nsgcnnqb0OrbqBJCMcTVree3P2afhrOtel6dlqqb3kr0jG0gKbDjYtUXAQovrcqpF6SbNh3VagQQH3dEI+cqdG8loTYVRSUrg0thXyYkEH/PFR6KDBHtKXje9uKCPdGcDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711667136; c=relaxed/simple;
	bh=KI7CEFgcmzK5wjsnY/Q5zxt2MYA7bviE7qSKhQfSO2s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FycMoDlnuGFmjbO3zYBsfMzrUu2lsktpG4YUdkAfURmtzQRlyf928J2e+RNKB1c1vm9uaEq4pRFv1QR90LtXAxdmCtPF/akH1MPyze3lDzokvU5gG3Nh6HBZnvBuSnQ4mWKz7rumH7D+IojpSsmedzkcyd0FpwM2jHjOOBHFQvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ET4LfCM7; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-614335f1745so4130777b3.1
        for <linux-gpio@vger.kernel.org>; Thu, 28 Mar 2024 16:05:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711667134; x=1712271934; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KI7CEFgcmzK5wjsnY/Q5zxt2MYA7bviE7qSKhQfSO2s=;
        b=ET4LfCM7PHGTO8C0E/rLiu53iWDlfMXeXzG9V/hOpPvxxp+0Z0XQ3/0tqCFJofn/Te
         zSsesqG2kcN8uwgEg0ic7JNaJrk1BpS+XMNpIEWlm9NqrA0jhEqvlo/osHRpTdh3aHYG
         s+lUIhXory7aAtpw2oEqm4juzsTjU/8AhUfonmwV7eB+VSRQwxx3ZnNQvzGnXufQ+A1B
         DibBbdMRAlMaQKiII7XDTGH7uFbitqrBwziLHeNbuw70zionhns0lI3LHqgDmtuZa/tA
         HGIr3CT9DARLImMHNbOABlX7ka+fp19mmKpYOVHt/VXAv5NElwkzBlS9utbdkQXJxOog
         /H0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711667134; x=1712271934;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KI7CEFgcmzK5wjsnY/Q5zxt2MYA7bviE7qSKhQfSO2s=;
        b=LQBhEO6nQTql75iWJDaAXObAliWyFJCSjKH97iFxZ0Z1dw7Gp+58rDh/orkd12wATP
         usvq9kKREZBwKYuHVhO3VqPsaf04XWIzycsGmBCgNjbo/+c+Dv1FAqxqzXEx9K0MBPkN
         I1Qxzl8OB17Y/kYJavwXFzBOXL7h60pD3lkDs3jTxHsI+gsrP7L4XHSjqVNsWQSL7u77
         YP13f9xNMUmyB7MXb98wMFiro0jNE6zdWyFkHhffUvZis5aHKHX0eB6X19LadBA/Tmt2
         uufqvyBc6uDUEGOgl/6gpBfYj0qKmHMYmG/qSRIdIa6ojvPmW/kYsaEVGzxRXGygnoPg
         XNcw==
X-Forwarded-Encrypted: i=1; AJvYcCXgC03oWlxLz2i618+DwM+rp+PgRT8PLf+HDtS52eny6bJl4llbk+E0dWGWtPxT0qqb0hGG5LHajWa+doqKqjNOY0PQzOM0WA/B9w==
X-Gm-Message-State: AOJu0YzuSAxLVzXtJ3liF540wHNinxQtLku6vSQnNtkbh9EAa074LKjf
	G1xY7vmkJsEMwNoSKttox033pLTKErkU6YrGptXpNzF5zh40u0FAxUwz+jIL7VwzXLY+37b6Z8c
	ktua3jYpdtz6r+0scAcnmaAAftr9kCcGGZc0DXw==
X-Google-Smtp-Source: AGHT+IHnYCZzEESPs5la4kmy6FqLn2ACVbVV+GNHRiZlp+4JYjbRsJEqzYox5Q+XbmXS/pU21NYc5OeGt7US3kPG2OI=
X-Received: by 2002:a25:bf85:0:b0:dd1:40dd:6631 with SMTP id
 l5-20020a25bf85000000b00dd140dd6631mr813474ybk.3.1711667133862; Thu, 28 Mar
 2024 16:05:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <578fbe56-44e9-487c-ae95-29b695650f7c@moroto.mountain>
In-Reply-To: <578fbe56-44e9-487c-ae95-29b695650f7c@moroto.mountain>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 29 Mar 2024 00:05:22 +0100
Message-ID: <CACRpkdZw-iG=33gygqy75yzRsv575sqNE=4W-ppKm1QK6fiiMA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: core: delete incorrect free in pinctrl_enable()
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Tony Lindgren <tony@atomide.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 21, 2024 at 7:38=E2=80=AFAM Dan Carpenter <dan.carpenter@linaro=
.org> wrote:

> The "pctldev" struct is allocated in devm_pinctrl_register_and_init().
> It's a devm_ managed pointer that is freed by devm_pinctrl_dev_release(),
> so freeing it in pinctrl_enable() will lead to a double free.
>
> The devm_pinctrl_dev_release() function frees the pindescs and destroys
> the mutex as well.
>
> Fixes: 6118714275f0 ("pinctrl: core: Fix pinctrl_register_and_init() with=
 pinctrl_enable()")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Great find!

Patch applied for fixes.

Thanks Dan,
Linus Walleij

