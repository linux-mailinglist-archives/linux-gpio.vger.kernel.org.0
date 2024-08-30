Return-Path: <linux-gpio+bounces-9475-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F164C966C4F
	for <lists+linux-gpio@lfdr.de>; Sat, 31 Aug 2024 00:27:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 634E2B223B9
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Aug 2024 22:27:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CCAF1C1AB4;
	Fri, 30 Aug 2024 22:27:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Nn0UeF1P"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D26901BDAB1
	for <linux-gpio@vger.kernel.org>; Fri, 30 Aug 2024 22:27:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725056823; cv=none; b=rcADaukrjIFWdNwYE3nUtulnGk7ty6RD8uZymnkhQ+aaNrH5zYi+/ZIaE4bKGqwy8omppCknYKBHXLNKNsIpUMzMr77t6HsEo5OOcqUPSyjWo1xpJAxfmBE9AUaKaw2rbVyvRa4aJ0I4M1e9Dl35iduVV16vW0/35FfFPy44tdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725056823; c=relaxed/simple;
	bh=8Lh24hus0rjK7CUq45NF9mCCDtg3veOIjr0iAiPjUz4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a2Z4nNOZ8WeT86vUynmXD8C+8pa4QzLSzL3o5aalpmuXRklZg+q3hanuEpXqwOsup4dm1u7EGvM0rjve+5VhxTC/CkCNi8EPoy+6Pa5yXXQR6ry+LmqE3agixXtv+2TvTT0wZyaOtDb4KYjmqdBz7lvGRsx32UP+TfFmY4fTx1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Nn0UeF1P; arc=none smtp.client-ip=209.85.219.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-e1a74f8ee51so1294281276.3
        for <linux-gpio@vger.kernel.org>; Fri, 30 Aug 2024 15:27:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725056820; x=1725661620; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DIIwaTSE/PgqTY8DMhEtWq0YA4uZMo8qA/f+VT8tu04=;
        b=Nn0UeF1PFzViXJf4hdf2VPr/FzBoM6EGpCBkUb+1TyXJ8KIdwP4Yg61J+9tQ38vdr5
         ebZUCk1A33XqMDIqbqeG6e0Fp9vAhdtaOCkMig3eOK2PlFMJ6IabbDf9HRktTyxtmnWM
         meplxwinznUCA8F4ERv8ykbgGTVRhJuvKMPmcIYuOodK6QDGS/mEmbkQAj7c13Fn0GWo
         A7hpI8eKiOKbpyb3821OJEapqZxrzY16noMrwV54UTVdQfYPAC8BtfIFw0gbLVBHrH8M
         cUb12QJtWTcY7M5LOt1vYYQFYgzPi7M1xgB24HEVak+sSSb6SDUbmPplydVWL0MhuHmB
         nlkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725056820; x=1725661620;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DIIwaTSE/PgqTY8DMhEtWq0YA4uZMo8qA/f+VT8tu04=;
        b=fFeQdZaFNr3bZ2ow+itPBm7kPuNrcAUajUMFKx8W75XE5WpkY6kwtLvqZiaFCSEtOS
         SEnsyCkvdHjlvBzYQz4lP4XutJE5N389y/UQj7jFzCic8ZtdlKIODUGLyUJ0cpZ/Sbr9
         J4D12kqN41zKq9hlZOTuEW94wchXLqXf6mn7VVbv4jl8RKOXRIGqTHgF4FzZzFtCSwDV
         MI9+3E/1wpFtCWBgsUuikcJBsnTVgXcA4iIX+fGhDJwGw3beEe6Cgx5JDMJ/xymAjBi6
         1XPWwEainIoVt5RLeKcvPAJnFLTEZCPOuLcB/6rv7hvEmnhyqiDQwplt1OsXGjV0N9jN
         akCA==
X-Forwarded-Encrypted: i=1; AJvYcCU2Te3kPMigqC/C8jPyFbyASVaoPwimzC+7QNUEp2jdYf2T0akdmeLv02tel0ASoQWVUfo5KndVfPpb@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7C3Wnv4lKDjiDitXbiYHONRJCXJRSRKKQ1Z7HR8B2aw6P1xtA
	gjrCT0neHwBrnlIO9mijJ7XQgW0aqDmns32g9uIbq+/yNIYvk6k/oS+LAix5T5L8X7BN0adcJxp
	jvphmQ6A7Iu9eBn+0iRHXH+LGYo5oNEifIdYBvA==
X-Google-Smtp-Source: AGHT+IGKz7xVnVfvTwXwQfWoEKUeTBFpqw9xJkBDAzZD/dsSS6r6zfs/JeF3YhTWw+lmD2/UUtq/r593P4hnq4uLa+U=
X-Received: by 2002:a05:6902:1886:b0:e13:dfdc:d83b with SMTP id
 3f1490d57ef6-e1a78ab4d17mr4208907276.0.1725056819690; Fri, 30 Aug 2024
 15:26:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <c0ecf4f4-94f1-2efd-b05b-fc117c62e516@digi.com> <Zs4m2xZ9CTgPBGX8@lizhi-Precision-Tower-5810>
In-Reply-To: <Zs4m2xZ9CTgPBGX8@lizhi-Precision-Tower-5810>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 31 Aug 2024 00:26:47 +0200
Message-ID: <CACRpkdaiSX6zbyqUqKPwApS-zQ8KYMCqHs0F7Sx17jGN1bpJoQ@mail.gmail.com>
Subject: Re: [PATCH 4/6] pinctrl: ls1046a: Add pinctrl driver support
To: Frank Li <Frank.li@nxp.com>
Cc: David Leonard <David.Leonard@digi.com>, linux-arm-kernel@lists.infradead.org, 
	Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
	Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 27, 2024 at 9:20=E2=80=AFPM Frank Li <Frank.li@nxp.com> wrote:
> On Tue, Aug 27, 2024 at 12:12:24PM +1000, David Leonard wrote:
> >
> > Add QorIQ LS1046A pinctrl driver allowing i2c-core to exert
> > GPIO control over the third and fourth I2C buses.
> >
> > Signed-off-by: David Leonard <David.Leonard@digi.com>
> > ---
>
> Why not use pinctrl-single,  please ref fsl,lx2160x.dtsi for GPIO/i2c
> recover.

I'm not so sure about that. Since the 1012 need to use a unique
driver this will be confusing across the family: one chip has
registers and values defined in the device tree, another has
them in the driver, if possible I would advice to keep this
consistent across sibling SoCs.

I can't stop anyone from using pinctrl-single but it's a bit
seductive in it's simplicity, while not always so user-friendly
with all the magic that ends up in the device trees.

Yours,
Linus Walleij

