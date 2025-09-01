Return-Path: <linux-gpio+bounces-25336-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 731C6B3EDA6
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Sep 2025 20:10:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F351C1B200D3
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Sep 2025 18:10:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 349D5324B0E;
	Mon,  1 Sep 2025 18:10:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mou8/7TJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 822B633E1;
	Mon,  1 Sep 2025 18:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756750209; cv=none; b=NhsLtkzq/hymN2Xvfgo9g3HBNtiE7sK2ZmwFnsBBHZS5943SRdbdEOmUGw+6gX1coSg3G9XMet3SsU5R0VhBrOo7bd79SpycoDVxzQjfIRhHb2rZBo9SH/O9vdZ8e3W6sMAkFYaCpp+5s2f0HjaeGIQcxg3pGdRddL/RITfesh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756750209; c=relaxed/simple;
	bh=u4s0dHyUeQUG6hbgBlysKLZwGtKp79dKBs5fUKoIwwE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nBwEKsIsaQ9Es1Z2ZUwSinEIeIujYoDGu0KhdLk7tJyLaeTNnk1AdfGxMhLCEPcaHu0YagyxKxMT7dFSOJmcKcuV3PyQO//zi9BeQdN2RPFws3aInKItMM7zh7o+/e2lxm0YlEtMcHBaW9OjxmOldZet7fLzV/+6tVJNZzjYENs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mou8/7TJ; arc=none smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-544bd485420so343783e0c.2;
        Mon, 01 Sep 2025 11:10:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756750206; x=1757355006; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u4s0dHyUeQUG6hbgBlysKLZwGtKp79dKBs5fUKoIwwE=;
        b=mou8/7TJjW22olwK8Fy35/h+5FRpL8kbpNXvzTl/LR+N70mGeZfynfLEYa+8coGktZ
         dm2OIKBiB3cUp08EI4Hdwom2B4FgpRbgHXvuQAqYLH+6RzC0lM+B6myW0kM/L7WynzXJ
         WfxpLv30/U/XtM34H5od9Go3k1mHvfwfYQz9hrrX7DM+vrNMwbrqGWRsN21PLN2T+yX3
         zZwTv5iO6x+1G0Rd0YKDb9xLyA8CIMUapBo09v/IdjwOOr2DHKn7SBJjUsKBoO3pyYqr
         DLkHUvJMCyMWP1EOxU2q6QsRSv2q3eeq6StuWvuOkqvmM9wOjnAhmYyZ7te3dOFxW9ng
         Rx9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756750206; x=1757355006;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u4s0dHyUeQUG6hbgBlysKLZwGtKp79dKBs5fUKoIwwE=;
        b=p3RrfoE2vwiDfMrIyezSRV5HrNJnLYQ6H5bmOPoeDT1hdyFcwAP0zYyp6yI5EDA/Xv
         YimtDjMUzz+nwwUJctIfhoUgLaNiZn39k0iFnVTmSyLg0iM/QAR7iJr/fowyeLQcszHt
         Egto4ijdysLxYHTcBcKjXUB55qh3G+7l69PmbWN9fKLq5nzQmEv6Z8a60qbQFZiELt+h
         x7D+sGZp5GAWl6CHFKmK91XziXnMX6rBtQZ0/54ksvjgdmiawABCLxuT6vMnlCHbVcMv
         gZUfxuAGYPsfRkznC8e2caiNAH6AQverN/lTESGuElHmYji9WGR1f8jTGre4IpfKIY1h
         yPFQ==
X-Forwarded-Encrypted: i=1; AJvYcCUKk31WPcf54qSr1v+ZLV6ecythY7DOATVl+0B9VcnCsU24vQyn7VZDQNHLv6pb1xxRRGAZvIrCUor+@vger.kernel.org, AJvYcCVR9zovmcFu9XnPeO/JWFVau8cgrF/BrFiF5YhYzj/b58hMp0gG4ZLEh/DjNBL2qmZiB/1aKUVISj/23k8=@vger.kernel.org, AJvYcCXF7GevxzyvVIKAi8RlP8WdTHkzNsKSsAA+eNHb9+n/z4fk7WcGXQFuSy31QVf/eHh5Ejy90IC7Q18GhkJC@vger.kernel.org
X-Gm-Message-State: AOJu0Yyh82atzB0oySKT06LDx/ptO1sPsRM+MCXGaABhyLlW2zxIDwK5
	3h7TiV/jfMXj8pS4PvFPtRyhOZJtgcnBla/fkd8q0W1QYatkx/UYCdnWr+b7EqZxek5XU8ByuhL
	sqWxlTb2fBzCt1kNINCB5PF38NTUkWZs=
X-Gm-Gg: ASbGncuT5CqPthvHj/ajTLkqAqctGVJpJddKheO4ciKJtzSxLsrd1wriVUDiKMbxOy+
	Jj+kIujk8/X0AVgk/LtfqZIMsjTJrGzkuLAlFXVP15aXR2QK+BPAzIP3EoxUJ7At+P6XQtnVJ92
	89F8c+23h8TnNrKGhrqd1I/JIMIz3chQU3N2KKCFhiWkNX5LN2SxzoUZOA38g2qrGdQtlVD6ix5
	95Jn4wj8MHiJkHBVgqy/PcEX5qQmorHOo+S1RfzEDlf1elofg==
X-Google-Smtp-Source: AGHT+IHXZ1r8GUTkdEGJtZstnBmcYDncXiw72Acoaycgnc5Y10NlmaPoxEphu/Y8hM9ev5TJlCyEe9lum5TKmzCXTGc=
X-Received: by 2002:a05:6122:3c4a:b0:544:9a46:7c85 with SMTP id
 71dfb90a1353d-544a019bb21mr2759056e0c.4.1756750206322; Mon, 01 Sep 2025
 11:10:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250901035956.1195081-1-alex.t.tran@gmail.com> <7de59d85-a72e-4afa-b3d7-8729e22f4c3f@sirena.org.uk>
In-Reply-To: <7de59d85-a72e-4afa-b3d7-8729e22f4c3f@sirena.org.uk>
From: Alex Tran <alex.t.tran@gmail.com>
Date: Mon, 1 Sep 2025 11:09:55 -0700
X-Gm-Features: Ac12FXznIgauai2qg9BT_nu_HrZkRzEL3M2uZi99adtx16zr_HtQ42YUlNTyMwI
Message-ID: <CA+hkOd4QmJ=VbWwjg36npFv3ZEuNVAj8Xw_QCPhCaF5k4dFFfw@mail.gmail.com>
Subject: Re: [PATCH v2] ASoC: codecs: tlv320dac33: switch to gpiod api
To: Mark Brown <broonie@kernel.org>
Cc: lgirdwood@gmail.com, tiwai@suse.com, perex@perex.cz, shenghao-ding@ti.com, 
	kevin-lu@ti.com, baojun.xu@ti.com, linus.walleij@linaro.org, brgl@bgdev.pl, 
	linux-sound@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 1, 2025 at 3:35=E2=80=AFAM Mark Brown <broonie@kernel.org> wrot=
e:
> This is a set of separate changes which as covered in
> submitting-patches.rst should each be split into individual patches,
> this makes things much easier to review.
>
> As also covered in submitting-patches.rst any inter-version changelogs
> should go after the --- so they can be removed by tooling.

I'll split it up into 3 separate patches: the removal of the struct
tlv320dac33_platform_data,
addition of burst_bclkdiv default value, and the conversion to gpiod.

Thanks for the feedback,
--=20
Alex Tran

