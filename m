Return-Path: <linux-gpio+bounces-12233-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DE6BB9B3116
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Oct 2024 13:54:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9D2AC2824C3
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Oct 2024 12:54:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 131501DA2E0;
	Mon, 28 Oct 2024 12:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cCgtsLct"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 996D01D6DAA
	for <linux-gpio@vger.kernel.org>; Mon, 28 Oct 2024 12:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730120081; cv=none; b=GhZK1Ng6q+28GfxcwYTFkOt3PqIdFh/UL10fg8UyvloYtfpOQDZpTVJMgu4i9dwWX7ecSqCvgjgIMikR5iS2JbAM2zcrw7Znq07G9+q7eM0WZGwN1rZlHIqKzGOg8skFFoUwkKqJxPYrj7fI+AzO5Qy/xj6eRzVmyqyA9OGtg5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730120081; c=relaxed/simple;
	bh=seI8UO8liH/MjIwO0BVJ3zPmW5DvN1lsIKmmEv7NXaM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ezbLR1g0DemYZTrYnjy2sHRQwl0JbVe4niBarn0M7QzBNOEFSyW0i1RYwX27WqQYlM9YouqAIdaARiwBlgB4uJEeO2Sq/crt/OCASQ5uoY+POvdEaOgvWk8AjbntKTSaI+IBjKXrDEkhdxwckiwmWncPwG48JntYJRQU7xzb0PY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cCgtsLct; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2fb5111747cso38146981fa.2
        for <linux-gpio@vger.kernel.org>; Mon, 28 Oct 2024 05:54:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730120078; x=1730724878; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=umup54zPr/YxS1kzJqH2Mzz16zItuDuoZj7kmVQKCCM=;
        b=cCgtsLctISLLOVkD2JfHx3DXEAKRHbBvGVz2c3+v4KfWascqOPvaLBpS6DHQ4uWQBB
         CHNn8/f7SxNrEqCV5zhHdRGrvaiUd6VxT5k8o5hI/kAx0ebEHRud7SorqlMSieIpNfQt
         VeqZ2oaHDKQM4UojFdMIHlgDwSMmvXYWnczte2kKdZTUVGapjSL5z1LDSqVHBFs0fcj+
         J4fFuYyp3kVoocZ35CIDJKa6cGuSbnmltDC3Q7Puu8vepXzTHJ4ZDw3L5gHlSAAeguwv
         f1tqeNoOALR1Dm4jqdG8fehR6Yv4LB2G9Ar9I1UQxIN7ODeXwZvRAa26vzae/xhQGzjD
         PJNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730120078; x=1730724878;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=umup54zPr/YxS1kzJqH2Mzz16zItuDuoZj7kmVQKCCM=;
        b=T/fXAUEE6C84UalVuZhDjbiRvFTi+AzjEHA3wnkPHM4tiads3GPdDgG1aH3pqUMX1d
         B852B18uRtoc5l1GmEZ1ASgF5okGXdt7a+3OFcj4LmZ2OYtLxFSoJhVGQRkcAgAk3X1j
         WIEyC9Ph0u96gd1//dOnHT2E7Cr1dZPwQq5KdL6ol8RMfhe2XQVPUcgwFjyitSlLrdwZ
         VejDWqS3DpVzcxLTNzlGpJSV0agEl19jhFF6MWRxiMFPgF8Cvn8PTEtHpfqbUdBCNpGT
         dBISble7CWCl2K8lRaawBcnii37wRCZ8ukaUxch3ZrTzS1zUM6fZDMnbxsAyQ/7whW9I
         z2RA==
X-Forwarded-Encrypted: i=1; AJvYcCXJBYw0qr3IhCvQSMTbkB5eXqeR5Vg+5F4XEqO9HH/eE49c9BiG8X7rd1XkdZL9k/J+p3h4m4Ic/5FK@vger.kernel.org
X-Gm-Message-State: AOJu0YxMBuC1qW3XQPPpbADMDfWNnGiMbJ8IiYm3uTM8AlOnDn/DOdCq
	e/plkhtkfjMCVXRvUMJMVGBgFOQfJNDuav27lV/Y1aDkLDVO2iu0h6b2SWt9+k8KhHC1RYXaf50
	5+wZCVXmapWWNsgEYiQ2gCtvmZFTA+5Em14EYexVw0W0Gw0Dp
X-Google-Smtp-Source: AGHT+IE0RFORu2qhCHVTzNL8EmTHxZvAv0CpOPcLoW/ThHRI1Ejo/uY+Ar9l2qfXZiVTY6d//qDHWFdO9TE8RAOq4Ro=
X-Received: by 2002:a05:6512:3b98:b0:539:f51e:2465 with SMTP id
 2adb3069b0e04-53b348cad03mr3726018e87.22.1730120077585; Mon, 28 Oct 2024
 05:54:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <4b5f1306-dc01-4edc-96d3-b232b930ddf2@stanley.mountain>
In-Reply-To: <4b5f1306-dc01-4edc-96d3-b232b930ddf2@stanley.mountain>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 28 Oct 2024 13:54:26 +0100
Message-ID: <CACRpkda=5rSCjoW0ScNg3pFFOjgSQEv8v+0ZkAw-d0pkF5CaZw@mail.gmail.com>
Subject: Re: [PATCH next] pinctrl: spacemit: fix double free of map
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Yixun Lan <dlan@gentoo.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, 
	Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 23, 2024 at 10:39=E2=80=AFAM Dan Carpenter <dan.carpenter@linar=
o.org> wrote:

> The map pointer is freed by pinctrl_utils_free_map().  It must not be a
> devm_ pointer or it leads to a double free when the device is unloaded.
>
> This is similar to a couple bugs Harshit Mogalapalli fixed earlier in
> commits 3fd976afe974 ("pinctrl: nuvoton: fix a double free in
> ma35_pinctrl_dt_node_to_map_func()") and 4575962aeed6 ("pinctrl: sophgo:
> fix double free in cv1800_pctrl_dt_node_to_map()").
>
> Fixes: a83c29e1d145 ("pinctrl: spacemit: add support for SpacemiT K1 SoC"=
)
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Patch applied!

Yours,
Linus Walleij

