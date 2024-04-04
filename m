Return-Path: <linux-gpio+bounces-5084-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B815C8986AF
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Apr 2024 14:01:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 41B2128EA84
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Apr 2024 12:01:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AA048662A;
	Thu,  4 Apr 2024 12:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eWdQNQqt"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 531D78286B
	for <linux-gpio@vger.kernel.org>; Thu,  4 Apr 2024 12:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712232034; cv=none; b=Vx7s+I0sPX4qkRLKrvqJt2nLTdmqdnDN1TxHK33VFOA00U0vCNNRhmt0Z9hSPeUbTSS7avPe25xI+CxnUVDnxiI84eQNfUEupNDZMqy0/wQCMSCSV4SrqANGLfaQmxUB0DuDoIZJceABd86oRN/sUnMyTKdH5UaoKphHOvOkn/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712232034; c=relaxed/simple;
	bh=8iw7mOeyVDZ0niVvfjQyNmrucbFUKpaFK5zyc7QXi4E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tnzyO0kfu/nWq5sH6cWCdA+RYbXoh08cUJCRtqlOXUATt6Jla+pjd1r1wJFppQBsyZg6oCK89EQCiGQStyC5YH7MoFUqAJboSHsExTbYxJyH9K5CxDIB8Ry/V59m0KwhANpYV01WEpPz+TEVNLz2L/qYqfCCcMROUy5dXq+Qut8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eWdQNQqt; arc=none smtp.client-ip=209.85.219.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-dc6d8bd612dso994841276.1
        for <linux-gpio@vger.kernel.org>; Thu, 04 Apr 2024 05:00:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712232032; x=1712836832; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8iw7mOeyVDZ0niVvfjQyNmrucbFUKpaFK5zyc7QXi4E=;
        b=eWdQNQqtJNKTIzZb8i1fghgfJPeHP5f+XzjXiGOa7DL7y97o5ik0tS3BBfoktgc+BP
         FdSfQ+c+1UmD6OCRQT/mxQ633wAS1jHY1pNdvqaAdgReXhYpFLEZ0yjNOX9Dag7ikkdy
         C/ZqMf3mIMouZnVp8TC9hT4xWHgcgWH/uR1ESxR5Sj/xvRYtaF+mVB3doeF0wVscLZz/
         Vvm+L0sxSGukbY8ON0JAL3YLPWejJrbhVMdUORSlFrbHvJmAmF2anhBDHsPiwjMmQSyO
         6/ScnNVcPZRl3pBfHT6yvODLSS9zy43z5T2Il2xRitwcqpYnO2veS8maN8tCz5JRDpoe
         /apQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712232032; x=1712836832;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8iw7mOeyVDZ0niVvfjQyNmrucbFUKpaFK5zyc7QXi4E=;
        b=ueDDvlx5byOcWVHpXYDVYKMc7jP4kqqeQzXulTFkPGTs2NL3evU9bTwxIShcPnEnvQ
         ebGh8uUjQz6j2UsldYP7jVcn302mTajwBKvug1GPO8lI9OremyqnrlmKff1rJLnBiVPo
         umxfKQIlWCBJy9zRVacaM+FfkouIISVX3UGiFdJL4k6k32IookVCPVX0KAofm9q0QkWM
         8qMPvjWF2j4qyyHWMoGXDZaowTx9YfInX9HT31a46HxdBFK88AlL0hHCUMEh1joYSbEh
         +n59lSdBn3LYUdGMdLIMB9uaZD+hqIRInhFIe/jpKqItFm+EoZVivS0LNryNgoSR3y3j
         feaA==
X-Forwarded-Encrypted: i=1; AJvYcCWjFl75nN+qBekz7wFC/4ksr2lNbtSpHgIEig6rUvmFjebiji+D8gmA6NDHclChgzdEgaHOxvfgP0R5QOLs4cBqtNZ0Ptt3ZU31Yw==
X-Gm-Message-State: AOJu0YxaPxCZZ1OPpXMetrb2x0G6Kzn+sSTRnPjFR+VX2Ehs+H5BvnkO
	Xpp5yBfHIOxMw+JsbY3nJwWLBz+8aOy6oJMQJKvu/cmB8+yEbc9RkE2QZicm56yA9q2lUy+aWI9
	4MHKWyClaALuFIp29iQJ+TmYuqQ/ZmPNIGz1puA==
X-Google-Smtp-Source: AGHT+IFDnGWYkUjulcl3b72iVoeMkRwAikOQXFL7/ONb9PVXD/x1iz8l+R04Quu2n+bUEuz2YG/VA0DhNbH70FEGXro=
X-Received: by 2002:a25:a3c5:0:b0:dcc:8c7d:970d with SMTP id
 e63-20020a25a3c5000000b00dcc8c7d970dmr2174589ybi.47.1712232032207; Thu, 04
 Apr 2024 05:00:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <Zflxi8SCzzouP9zW@login.tika.stderr.nl> <20240319110633.230329-1-matthijs@stdin.nl>
In-Reply-To: <20240319110633.230329-1-matthijs@stdin.nl>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 4 Apr 2024 14:00:21 +0200
Message-ID: <CACRpkdaBXtR9m-ksn=rAwD3+dPDN_74zRVM183pam0zk=bf9Nw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: single: Fix PIN_CONFIG_BIAS_DISABLE handling
To: Matthijs Kooijman <matthijs@stdin.nl>
Cc: Haojian Zhuang <haojian.zhuang@linaro.org>, Tony Lindgren <tony@atomide.com>, 
	linux-gpio@vger.kernel.org, linux-omap@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 19, 2024 at 12:07=E2=80=AFPM Matthijs Kooijman <matthijs@stdin.=
nl> wrote:

> The pinctrl-single driver handles pin_config_set by looking up the
> requested setting in a DT-defined lookup table, which defines what bits
> correspond to each setting. There is no way to add
> PIN_CONFIG_BIAS_DISABLE entries to the table, since there is instead
> code to disable the bias by applying the disable values of both the
> pullup and pulldown entries in the table.
>
> However, this code is inside the table-lookup loop, so it would only
> execute if there is an entry for PIN_CONFIG_BIAS_DISABLE in the table,
> which can never exist, so this code never runs.
>
> This commit lifts the offending code out of the loop, so it just
> executes directly whenever PIN_CONFIG_BIAS_DISABLE is requested,
> skippipng the table lookup loop.
>
> This also introduces a new `param` variable to make the code slightly
> more readable.
>
> This bug seems to have existed when this code was first merged in commit
> 9dddb4df90d13 ("pinctrl: single: support generic pinconf"). Earlier
> versions of this patch did have an entry for PIN_CONFIG_BIAS_DISABLE in
> the lookup table, but that was removed, which is probably how this bug
> was introduced.
>
> Signed-off-by: Matthijs Kooijman <matthijs@stdin.nl>

Patch applied!

Yours,
Linus Walleij

