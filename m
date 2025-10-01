Return-Path: <linux-gpio+bounces-26742-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B8C7BB2055
	for <lists+linux-gpio@lfdr.de>; Thu, 02 Oct 2025 00:51:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B4847321F13
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Oct 2025 22:51:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5126E2ED853;
	Wed,  1 Oct 2025 22:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oqVhDSWa"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 477B6208961
	for <linux-gpio@vger.kernel.org>; Wed,  1 Oct 2025 22:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759359093; cv=none; b=RECaP8fAIUAMw7teEbNT9aQMuKRW7lIfjq+oj1StNUMRcG4T9STdD/gUWcIMBWISYKrFj4PpJTLuSUjstjImW2iG1jYl0fg+fH0icapk0VrPVdntTAV7Th+Nafch4hvbA06HpXP/wS5kP/cDCKjDA7u6tvnJRo/f870ec/uqYSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759359093; c=relaxed/simple;
	bh=08pLA6uxYNg9rbeHvjBsye3PWUrBRwmKepxA6EJcxe0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=F20wMZYI4jAsWgNcYL1ZphBgj4V66GmZ3JxWvWvmZc7tfhBpkqqf37qawaG7c8OhkLHtPwrWWhocF0jPUwy0WU+HYCbR8e3OYHQpy53QAVJu2/jAuLaFER/6Raat5sOR0oqs5hEOkJrK9s90RaRGrFTQ4OOveXH17mifCXpb804=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oqVhDSWa; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-57edfeaa05aso482040e87.0
        for <linux-gpio@vger.kernel.org>; Wed, 01 Oct 2025 15:51:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759359089; x=1759963889; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/El6nTOEVq1mgmvqeb9mwzaWUPYnE1qtwgZZVfI7LtE=;
        b=oqVhDSWanj1MivadP6yuezxtfX73NYGCVxq9aFl5+NAbjwO76GIKllEZPMxUAspbRN
         SmuttDj+bdmXNgdlBeCvcNFCD8cpFzZeY9cbDceB3QUuMLS5z3ucXpEW6ukJI0k6ItE8
         3wc+fD/8JXWwRRDsqS0gX/af6jZRgepzOc3LwHgCkMhW9HsD1qsCJ7XpPyVG082KdugT
         uRTqAPL2q48WFmJXI3lCUxbCRxRCPjWWaZuWHUneetf8ql1djuUvJW+061Q1fRlJc0jS
         tVrhRpN2jTovH5ytQCaahAZJXhyW8GsEf59Mwg0jGY6Gh0/vGOc4V+a2PH2cTC7rJQeO
         I6qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759359089; x=1759963889;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/El6nTOEVq1mgmvqeb9mwzaWUPYnE1qtwgZZVfI7LtE=;
        b=ZEhU2BXRxW/I5f/IXQ1Pd5GrW5PHpWtTRv4qJ3oNKdpAJYvbS+pmvKtrJqGIrP4F6i
         2z2XEQXnAAL1jR6TpUmMoUJOBkJ9uRtwt8I9HDM1cyrVruKal4RlRioVhExrlgJOr7CP
         pMda7YqhxyF7sKM4bjHr8LNlFxzOUJSqG6VTXPkmy2R9+JB65IWHzvJQDNLmYaAAr7ML
         lGSXjkRnt+SuFWnxdBagpvm5/2M2XMb+tXUgXkDCdc3k60zFvQu2U38150FFtPlxPdeQ
         9sSFk2dO6SiqATWh8OILNKmXmKkr89N3MHFPo0OQMgqpMgcpTaq+dcC6KTBnkpZUP0lL
         kcHg==
X-Forwarded-Encrypted: i=1; AJvYcCUDe4OmA2qI7cWoeuAKev9jHGeOoLw5mTj6sKEdOniUwaEcBMYFRkJ0lxZIHMa54lns08GGg7ssYxri@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9CDACSF/3MJkx/WxaYZNI3UV71SquAMsRKYvEdEDFQWBSQZD7
	WoeF0qAdAaTFDZ3ASAxWR5pTqWnG1xTJ8ZiJDjU8Ish67/8SCedDd7PDzsaDZKfmp2PmpViAXYw
	vNzWymIgaMY1U8lilPS86vaM9RpkL076p7IQTF219rw==
X-Gm-Gg: ASbGncte1qgvJIeW9ut6Q24CcOZME279C5fPhXQAtmja00gmmsLSthqpZXPzVvYEhl3
	O9ORQteTBp+aatMX8ejBFCOQ61yhXBgPpmESVwIm1V9RNmXMNK+23GWAyeCHdxDqJTQX8/jEm2N
	/qmRoAMXmCcSMUOPfkooNzuTMD2HvR6jBDiNoN7uAy8zvIws/gzYsegI1p5L4pdOLrjPUlFInYP
	XbM/nrUA/EJZXiXB6i4rgI6LeMCR80=
X-Google-Smtp-Source: AGHT+IG2EoJMbtOR1ucq5piwVhESl5CoUICqBHxFOFrJm/XK8+UWh8f7SohCCH7p+awKgIV85Zu3ozKF7W8Y9/Mpv7w=
X-Received: by 2002:ac2:4e0c:0:b0:58b:27b:ed30 with SMTP id
 2adb3069b0e04-58b027bef54mr44123e87.22.1759359089374; Wed, 01 Oct 2025
 15:51:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250923133304.273529-1-mstrodl@csh.rit.edu> <20250923133304.273529-2-mstrodl@csh.rit.edu>
 <CACRpkdZ6_YkUsCNRFfRM1v68fpvAJcdqPRtAKTGqLqHf1geJog@mail.gmail.com> <aN1DlPjbQgzfmpUl@ada.csh.rit.edu>
In-Reply-To: <aN1DlPjbQgzfmpUl@ada.csh.rit.edu>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 2 Oct 2025 00:51:17 +0200
X-Gm-Features: AS18NWDJdyJJcLa_Ae7lK3Nrlr8RU3QkKiJmc2BQNRUNE99-LTxcVXK-WDjcBmM
Message-ID: <CACRpkdY+r_u12iLg2-niMmw1M1Wdtm3yckbby_Wo2L+_BvDuZQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] gpio: mpsse: use rcu to ensure worker is torn down
To: Mary Strodl <mstrodl@csh.rit.edu>
Cc: linux-kernel@vger.kernel.org, brgl@bgdev.pl, linux-gpio@vger.kernel.org, 
	"Paul E. McKenney" <paulmck@kernel.org>, Tzung-Bi Shih <tzungbi@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 1, 2025 at 5:07=E2=80=AFPM Mary Strodl <mstrodl@csh.rit.edu> wr=
ote:

> With that said, I think now that I've found spinlocks work, I could use t=
hose
> to gate access to the list everywhere, and use the standard lists api rat=
her
> than the RCU lists api. Obviously teardown of the workers would happen ou=
tside
> the spin lock critical section, guarded by a proper mutex.

Yeah RCU is for massive parallelism where you have a lot of (performance
sensitive) readers and a  few writers to the struct.

If this isn't performance-sensitive and doesn't have a *lot* of simultaneou=
s
readers, try to use simpler locking mechanisms if you can.

But if performance hampers, RCU is surely the way to go!

Yours,
Linus Walleij

