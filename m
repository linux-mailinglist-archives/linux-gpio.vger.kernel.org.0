Return-Path: <linux-gpio+bounces-30032-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ECC6DCED77A
	for <lists+linux-gpio@lfdr.de>; Thu, 01 Jan 2026 23:37:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E4C4A3004CA7
	for <lists+linux-gpio@lfdr.de>; Thu,  1 Jan 2026 22:37:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A9F6242D9B;
	Thu,  1 Jan 2026 22:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ldleX95I"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E386222597
	for <linux-gpio@vger.kernel.org>; Thu,  1 Jan 2026 22:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767307046; cv=none; b=f5uqgJs2rdxDBnMEvsgzZZ1sDrWJhPg+etrycAOHofoac+lpu76SBBCTNKPDKhdc2eENNZbrCAup2+mrcr+bBLxcjyj/QAIA9rcwG/87mUh0EGD3ezOJVCwa2sC5CUFNjn4f5xWEy1rve+9yG9amCeKPp7UHGoQ5qcgHlG/jzEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767307046; c=relaxed/simple;
	bh=4NjZxR7n/i3V7hLD9I4rLfeAHHpOdNccUfDSk4/Vc7I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BE0ehNbdlhTs2DZptEx4iSfnCaSDxdJCuoJqVsTCxN+tvLJOJ4yslSwUZTaBDWzM9kWIRrx+A7AB6DDKUkolkyW1/F7gaUGgsP1lzZQ6cJ6CUd+/QyO0IEUXpu2dKlqp+gMz9iDuZXrqnuKIiTQzn1lSl3XcZmDukEcmslWuigk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ldleX95I; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E30BDC19423
	for <linux-gpio@vger.kernel.org>; Thu,  1 Jan 2026 22:37:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767307045;
	bh=4NjZxR7n/i3V7hLD9I4rLfeAHHpOdNccUfDSk4/Vc7I=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ldleX95IA/Rhvnga9zhFQWYGX90TGGbu/MedExFGoLKzVm9VARMh8b4CPjo/2oO4z
	 uKiJMDiRPe8vx9Ae2im5rgASh7toMyvrp+3s8uV+b4s2A1bo2kIMVdy/np8WxJ0nFF
	 jpnUfQKMo0eZWT2s3O6705wXXVNYU0bfvpsidNKw5cKrp6aHSDERDTXmzczKXpTR+H
	 tz2TLU3He7TUxiY7sjfuAbq5j/4OEo5k6fbMpAy+E9hoj9Y5cZ0GOXDFSkbrB+HL+d
	 0Z0ONjr6g5QbbGc3ZTShvcyOdNkauf7dciFEh9mQ4iBPiJyTohSkKFEEp8kOKXbz2o
	 SyoTt/wvt2k6Q==
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-644715aad1aso13486018d50.0
        for <linux-gpio@vger.kernel.org>; Thu, 01 Jan 2026 14:37:25 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUg2nFz2LTFkLNoS6ppj3Lwf3l4hbaIqfy8wb58PjCQqZn8i5fGqrlpu3csqVZWo+56ChrQ3jugqDdq@vger.kernel.org
X-Gm-Message-State: AOJu0YwUSShF3aj/wZEQAmdroEahL/GfPv9ZuRQtno6g76uM4uVreN1A
	9T4GWT5RwlPVMuUJE++a4pH9CQRS7MzCSNvHw6wSm0Q6xjDfewxmTPyTiFPTgqG6UfGWJlOeybn
	wgHBkOeQIbcjk1OPP3xcB03ekb7hi4KA=
X-Google-Smtp-Source: AGHT+IGxfFDsTCRV20/MitXOg9IYsjIgYuqKye3DeOL8wH03xNmqZuWnyqOfWZ2rc2d7AeH+J//qkrFfgP8RZqpfLp8=
X-Received: by 2002:a53:8585:0:b0:644:60d9:8661 with SMTP id
 956f58d0204a3-646632e1cd7mr26165537d50.45.1767307045252; Thu, 01 Jan 2026
 14:37:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251219-gpio-of-match-v3-0-6b84194a02a8@oss.qualcomm.com> <20251219-gpio-of-match-v3-3-6b84194a02a8@oss.qualcomm.com>
In-Reply-To: <20251219-gpio-of-match-v3-3-6b84194a02a8@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 1 Jan 2026 23:37:14 +0100
X-Gmail-Original-Message-ID: <CAD++jLndAvhQC_pxU7fU2DgL2HyosfNQqnTxVXrm4uLNK59y3A@mail.gmail.com>
X-Gm-Features: AQt7F2pIVe2by9dHgGDwlRyH8hysFAWe6pLdQf74mH3djmHANQGvVjg82Ayxg4s
Message-ID: <CAD++jLndAvhQC_pxU7fU2DgL2HyosfNQqnTxVXrm4uLNK59y3A@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] gpio: zynq: Simplify with device_get_match_data()
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Joel Stanley <joel@jms.id.au>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, 
	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, 
	Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>, Srinivas Neeli <srinivas.neeli@amd.com>, 
	Michal Simek <michal.simek@amd.com>, Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 19, 2025 at 1:13=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@oss.qualcomm.com> wrote:

> Driver's probe function matches against driver's of_device_id table,
> where each entry has non-NULL match data, so of_match_node() can be
> simplified with device_get_match_data().
>
> While changing the error message, switch to dev_err_probe() so error
> path is a bit simpler.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

