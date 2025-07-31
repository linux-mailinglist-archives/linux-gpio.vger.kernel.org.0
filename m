Return-Path: <linux-gpio+bounces-23915-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CAE74B16E12
	for <lists+linux-gpio@lfdr.de>; Thu, 31 Jul 2025 11:02:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4E1391AA7F06
	for <lists+linux-gpio@lfdr.de>; Thu, 31 Jul 2025 09:03:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 999E32BD013;
	Thu, 31 Jul 2025 09:02:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oJz5Gbaq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55B0329994B;
	Thu, 31 Jul 2025 09:02:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753952555; cv=none; b=BnQepeUfAutK+wNdpJil7C80Eu8RpGA6odMKJcUeuaRjcV9e5vGxGSboEne8d3liA0P7KpF0IBfWwsQ+KeXYnUqa72QbTUcWG973QOmzm0xQqWbUKuwsI0OsnI6D6DriYuJ2990RaXzIXs5W6Kg1tfe9szTPXuh8vdZuISQ1nYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753952555; c=relaxed/simple;
	bh=rBvKooI8uLrGB7LDoTsQ+vWdoAN9j0Kp0TmnAKR2yrg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=jT4yMQj8mIn47uaWxeRhwB5IHdwxmdJCklhV4SUbgxyPeRo+FGlY7CqP3+4gb7Uypp9JsLs7+7f2ShZ1gE2ZW8xvwWgx4VdncCsU8MAoyB8E64wycKlSaaAMkU0MTdfHIiJhdE5k6+9/jxWANjQVxOo7da7Euz7zk46iwhUWz0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oJz5Gbaq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5D96C4CEF6;
	Thu, 31 Jul 2025 09:02:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753952554;
	bh=rBvKooI8uLrGB7LDoTsQ+vWdoAN9j0Kp0TmnAKR2yrg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=oJz5Gbaqif6ggAEXa1z14AK8O8xIDzFI/Q6AhHv7+HTWhnPm337QNHPSZtQR8tBgQ
	 smjFrAx9KvO+wuD+S4IsqKgu5KmB00MDtNMJFhLcdkKMA0J2ztHLHklaeRNu4VbvL3
	 O63F5uFgFfW91gZ5yGZAOyR9KSCGR99XLEl7v6N6X2KUunpkGJLHQbqiCJvIQ0w4Ec
	 bYc2cuCeslwd6H3KrlD9CULo0ObW28chEPJdESKJaoMJHJGF5mHAVa5XI2ptHg1mR/
	 KeMG/j8uQ8NMBiL6aDfJisLzN0Vq7CJ83bkTNaEfGKXFkGO3tffdn+71Fb+Fglmwp+
	 yQnx8ysuhN4GA==
From: Lee Jones <lee@kernel.org>
To: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Lee Jones <lee@kernel.org>, Dan Carpenter <dan.carpenter@linaro.org>
In-Reply-To: <20250717-adp5585-drop-ret-v1-1-2ae65bd780aa@analog.com>
References: <20250717-adp5585-drop-ret-v1-1-2ae65bd780aa@analog.com>
Subject: Re: (subset) [PATCH] mfd: adp5585: Drop useless return statement
Message-Id: <175395255348.1068483.17805196039345490694.b4-ty@kernel.org>
Date: Thu, 31 Jul 2025 10:02:33 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-c81fc

On Thu, 17 Jul 2025 15:51:34 +0100, Nuno Sá wrote:
> In adp5585_reset_ev_parse(), when parsing the
> adi,reset-pulse-width-us property, we were returning in case it was
> found and valid. No point in doing that as we'll be returning anyways
> after the exiting the property scope. And it could actually lead to bugs
> if new properties happen to added after this one.
> 
> 
> [...]

Applied, thanks!

[1/1] mfd: adp5585: Drop useless return statement
      commit: 649c3af846064d9f721e976295db7bcc7ad2bffe

--
Lee Jones [李琼斯]


