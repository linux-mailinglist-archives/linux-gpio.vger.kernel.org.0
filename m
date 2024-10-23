Return-Path: <linux-gpio+bounces-11847-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C7ADE9AC73F
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Oct 2024 12:01:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 862CC2837EA
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Oct 2024 10:01:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C7A01953A9;
	Wed, 23 Oct 2024 10:01:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CrWmZRGm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95C6C1990C4
	for <linux-gpio@vger.kernel.org>; Wed, 23 Oct 2024 10:01:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729677663; cv=none; b=h0R2l691CaU0zN4UhIV86kyn15oWBIB/SwF/Fu9Te3wjwZp4GNE8XAaHHtuvSfAkxC3q3naZ8ybXpIPiNVPuNgKlOeggoOuS/4ome4yn2/xm2Fi9L/JUr1twVv8QNJrleKh6VRa2cRnwbvhCEDw2TVhbwkGyqq/ZrcU9WfB5kDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729677663; c=relaxed/simple;
	bh=ZUGc29XkalHds14dCBS9QzTZFbVomRvEcXD27v6fsGM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S/W3DqqpGLHFYGRtqJhC0+KZL2NcrHtHjL1vvAyZGz6L+muJqezZuziH0Ymb64ATMEqWwxR2ZfNszleYZ87V4McecQH+SN19U2TY2xs9aTA+H9YXxyG+ivVRRXtPj9yvqb1IE0oaAjQfF0A77v/NYEAbQHQ3MdoZ+bwmerPcE7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CrWmZRGm; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2fb4af0b6beso102691161fa.3
        for <linux-gpio@vger.kernel.org>; Wed, 23 Oct 2024 03:01:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729677660; x=1730282460; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1AVT/oXvnz327r71R8h8SLtTXDuNUikJe/baXxzlt7M=;
        b=CrWmZRGmVyhljKolnf1UewFXPdO4kYq6II1J4PCFj1zk2WPmxDIqhJD1XnAExw27sB
         uB/o5hwtonzx0/wRijgWwGcgCpenXIQO2AD/i93m+qJ/jIWYuIYPYjphC2TCRbQKONGW
         8TyT/uYR2KovKhIjaBQYB+qfqpotOz+38kMAhYmnDH0Kqv49RDVQvOu1OXkrIuVNu1Gw
         5shpJos4LxmNP0mkuZU2sXd+pHVqcFcBBBiQIRjHw6TwtMkMCYyTOnY54ElY/p7qPuHK
         7dnJJ36xubGyB3NDDy3b/Fi0hC2r9jx+Mq3PjmLe3Szg9hZB2eon7P/VgOLfY75XW9Tf
         zsnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729677660; x=1730282460;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1AVT/oXvnz327r71R8h8SLtTXDuNUikJe/baXxzlt7M=;
        b=pVhZ8BrzMGszUNd4GL/UGJFcYlCW1gQeWN/eAGa63KfHI9H7+cCYMkxf+tePabO2Tc
         xsGe8lVrlJMeA3UbJyMg0vxuGL/mUxhCUEBihkzKHO35i+zgKUIqhVjfBTqmcBMWwSlz
         Mn5igmc/eK9BLufInfYVg5ozPyaVC92tkfcsVemabioKHBcASlgP+su+D2KwlZeXKAMD
         keIGffk6dB3ziHtjC575mKyXP/RJbFINGI4ATSUYe4PBXoSi4MtK8TGQzgM1hV8Ss7Xe
         +fcputR32GLKT5kevkfUE/cW2036WDqTkK54Dzc0QRvjSFVogFpkjUh0Oy7dGe/zg2XN
         qlFg==
X-Gm-Message-State: AOJu0YzkUoEG1lvfcZnzjrlsQXDfyBk6ENnWHjDcDfxSfHWIEIVaXlbs
	nlH/IWm0+Ysz/u1wSrlhaBthbe7HL8HjIKnoDfMAbVTjgLa+15s3Y3Z2qhQFYxh7+vj7JaB3Acu
	6b0EkN4DsWpp4LQhuzfQ97EE3lNPn/350nMdZzg==
X-Google-Smtp-Source: AGHT+IHE0gsgDLAMHvDGbxM6ahyc/2CXAluj9jyUvAlvq5X0bwerV4oeMKszRONGYK1KtMvqz8Bpm1IOjWxZhoK3CgU=
X-Received: by 2002:a2e:d12:0:b0:2fb:357a:be4d with SMTP id
 38308e7fff4ca-2fc9d588b91mr13043511fa.43.1729677659658; Wed, 23 Oct 2024
 03:00:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241014192930.1539673-1-quic_mojha@quicinc.com>
In-Reply-To: <20241014192930.1539673-1-quic_mojha@quicinc.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 23 Oct 2024 12:00:48 +0200
Message-ID: <CACRpkdaAVE8VMNCFA4jQ1+YLuC9=4mc9Bp2PRxeNFQoHB+NJrA@mail.gmail.com>
Subject: Re: [PATCH v3] pinmux: Use sequential access to access desc->pinmux data
To: Mukesh Ojha <quic_mojha@quicinc.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Mukesh,

On Mon, Oct 14, 2024 at 9:29=E2=80=AFPM Mukesh Ojha <quic_mojha@quicinc.com=
> wrote:

> When two client of the same gpio call pinctrl_select_state() for the
> same functionality, we are seeing NULL pointer issue while accessing
> desc->mux_owner.
>
> Let's say two processes A, B executing in pin_request() for the same pin
> and process A updates the desc->mux_usecount but not yet updated the
> desc->mux_owner while process B see the desc->mux_usecount which got
> updated by A path and further executes strcmp and while accessing
> desc->mux_owner it crashes with NULL pointer.
>
> Serialize the access to mux related setting with a mutex lock.
>
>         cpu0 (process A)                        cpu1(process B)
>
> pinctrl_select_state() {                  pinctrl_select_state() {
>   pin_request() {                               pin_request() {
>   ...
>                                                  ....
>     } else {
>          desc->mux_usecount++;
>                                                 desc->mux_usecount && str=
cmp(desc->mux_owner, owner)) {
>
>          if (desc->mux_usecount > 1)
>                return 0;
>          desc->mux_owner =3D owner;
>
>   }                                             }
>
> Signed-off-by: Mukesh Ojha <quic_mojha@quicinc.com>

Sorry for taking so long!

I was turning the patch over in my head for the fear that something will
regress but I can only conclude that we need to test this in-tree, so
patch applied so we can get some rotation and boot tests in linux-next!

Yours,
Linus Walleij

