Return-Path: <linux-gpio+bounces-17091-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DE060A4F841
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Mar 2025 08:49:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2F2E03A7A57
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Mar 2025 07:49:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B5ED1E5B73;
	Wed,  5 Mar 2025 07:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZX1h+g50"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5700D78F24
	for <linux-gpio@vger.kernel.org>; Wed,  5 Mar 2025 07:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741160952; cv=none; b=uo/xWTANv9JohBwvBl7fEID904OUc8ID8UdBNPmhBo7VMYfV1yejcVsHyDbJdPkZDb0h4z7ejfi1KWTLSh+sw7PhriUjeMN1q2uKv+eBHoA7SR8URpJtmjoHZFbYtDGhp0A+QvwWgunQDTReYfSqMN0EeClrpmENO48d0T5oeeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741160952; c=relaxed/simple;
	bh=YgJ7FqNNfYxDm0I1ccxKkOvd8zuPiF2Sp2+E3IVga3Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mFc9SsXAMRh6jViv0IAdiNwJ16sz8u0qFDLXz3wmm+OCpSNsbwAt/+RNrqPfRx2h9gAA7TppyxyM20Bcgj6ChD5SLAeHgbdPcyIsnCMDLLYd1dDeNvt7417Pu8WPq45Os6Vg4Ptx5BeF1CBlMCkg7cy4uLBOq6mibC4NYvqYcAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZX1h+g50; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-30bb64a4060so26947361fa.2
        for <linux-gpio@vger.kernel.org>; Tue, 04 Mar 2025 23:49:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741160948; x=1741765748; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YgJ7FqNNfYxDm0I1ccxKkOvd8zuPiF2Sp2+E3IVga3Q=;
        b=ZX1h+g50gyZtfi8GVOhSL9P+Iywhb4BguZ5BkK4J+i7aUKCJ7peyBnj8JxqUlLq8DH
         dh2srg5vm7xD/fsSnD62YnYp3+kEYAYpkp2ZGr7QA8v8KXRUKMptKpANFJG3Vss+Q3u0
         5ocWX9jKTBQPNBIxi8kNv3RIZGzalIjcb3Rcd4hslJI9g5WA9FFUuETTh6XMt1CCswQ9
         q5p2bqLzpbsNIq2plsBWrIHwpuO0U4VNqCo3uYPvuuMr3bOo/OCBsbRGVEzCecV9mlbz
         JfuM37HEzANrzJFlRAenR7j9RJe8eZhHcZJwdvqpJ9qgJdp+o4bne+NaCEwFLUhP7HQ8
         rOcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741160948; x=1741765748;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YgJ7FqNNfYxDm0I1ccxKkOvd8zuPiF2Sp2+E3IVga3Q=;
        b=DCRPtG/zeNfanpT5vtR6QWHgjLJ8zfyt6hxO0S0dsSxabFAEPKZy7iE3VO4XND2s3A
         vgBCDU5TTS+p9xv4NcGWS4dJxtk+9TS1JCEytiCJz/TDlFgNZYUqvlGmA0BrK1SOy6jZ
         VV+gXUBZicFk87d5UbHeXz6Iweynlsuvybks4Qlouex/nK13VfGDjEZ8D7OVmZNqNAQe
         0zS8oOivtXBOBoFvQPL5lLyGJW62kvSTg1JPUU007Po/cQ8ecRj4K4cVKhTKt8hnoW45
         8hHsZM90SQKzaL81fV0JfHruejnn5GsOx0jqJeubPBN7KQ9iQ/PQpePoWESKNK7RCpU9
         NpkA==
X-Forwarded-Encrypted: i=1; AJvYcCUei75EJdFBHLtmxI/znomWJV3BkuwICfftbAwClII2FdGfFy+fdU9MwI9wruFRgLeFMQq29p0dmkro@vger.kernel.org
X-Gm-Message-State: AOJu0YyNqkQ8fHhl/azDtDdjiGDmYjcpDDNILkHll5zr0CHeda46AQ7L
	B6O4VqnVQTsiBSckO0BYVZWl2iKqHGyOrv3lnspOKZZJmDFhjA7WBjlm/1z2S2PtIbZQ6k5x555
	xDtprCoXAgBWiyzECy4we3inKoyEQyWcnCotamw==
X-Gm-Gg: ASbGncvHFElWXnugn1U/4ziIm22JdnNmIbWMFrwsxJW7DNWzFVG9xiIieIdqmBJWWCJ
	QSpXBRHw1wYS2AkGP7zZ3iLOWLJU4r6H33IeZEY0EAGSibKO9Fmgy1ge0Vu3lmCT8ifmCaf1l2j
	m1vYiF9dUDO3/q9u8kDL733PU4jQ==
X-Google-Smtp-Source: AGHT+IFHtDRRBP8bp5gdkXIA/EIpFpVmPLRt714LmAp0yuV8fT6QJ4wXCx6DXthE/zk4hC6vZIUQxWhAmu28h9aTZAU=
X-Received: by 2002:a05:651c:1a0c:b0:30b:b908:cddb with SMTP id
 38308e7fff4ca-30bd7a41efemr6683181fa.16.1741160947020; Tue, 04 Mar 2025
 23:49:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250304232051.2936557-1-pratap.nirujogi@amd.com>
In-Reply-To: <20250304232051.2936557-1-pratap.nirujogi@amd.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 5 Mar 2025 08:48:55 +0100
X-Gm-Features: AQ5f1JpcS2hDMJY0zmeOcS9nhyjweLA5ITBHgv88yn7QrJ2qKvgEdvrG7E06mzo
Message-ID: <CACRpkdYxZ=7RRvjKpQW9_mZG_KDXuAt6kdDZDKWJxx-f1BRvCA@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: amd: isp411: Add amdisp GPIO pinctrl
To: Pratap Nirujogi <pratap.nirujogi@amd.com>
Cc: krzk@kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	benjamin.chan@amd.com, bin.du@amd.com, king.li@amd.com, 
	gjorgji.rosikopulos@amd.com, dominic.antony@amd.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 5, 2025 at 12:21=E2=80=AFAM Pratap Nirujogi <pratap.nirujogi@am=
d.com> wrote:

> Add pinctrl driver support for AMD SoC with isp41 hw ip block.
>
> Signed-off-by: Pratap Nirujogi <pratap.nirujogi@amd.com>

OK, driver looks really good after the fixes, it's also simple, elegant
and self-contained.
Patch applied!

Yours,
Linus Walleij

