Return-Path: <linux-gpio+bounces-9939-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 78820974500
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Sep 2024 23:48:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CACAEB24358
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Sep 2024 21:48:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F62318C33E;
	Tue, 10 Sep 2024 21:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="FUWo2TzP"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B21B16C854
	for <linux-gpio@vger.kernel.org>; Tue, 10 Sep 2024 21:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726004880; cv=none; b=FLcojRWG+OHFPTpd9wuUkEcMHB4iux7I9uik2RWTOtOTwqfgjWO+GVBXqZh+bvMiCFdPKQ7a5DHtGH4c2Puww8VqxqcPk3c7uNq0FNo4E3sYz5+uoy4R57xmAUpiT6Ds4lfb2lG1xgYjpyZH1NatVUSZ09dVIlDafeHGALcdgUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726004880; c=relaxed/simple;
	bh=bIDPNpLbL9Ra+IjECuAzhK7T5kYRgAUvmE9/8o8byCU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=txvbsN6a6tAGKu1ha5i6gHXtDeqNlx4CxquEnbgI2uxW6OkjQ/BCmd7mR4iW9+UGMPTb8WGqt/GUTjJ7wZuvN0fGffVYX8GCdSpZDnkcLbD5/FZF1DRNYzgTY9HrlhAc5RbaXl0DXTxhxTU3DE3zDe/V4GMijAl+HTkIoOgJYIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=FUWo2TzP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67ABDC4CEC3;
	Tue, 10 Sep 2024 21:47:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1726004879;
	bh=bIDPNpLbL9Ra+IjECuAzhK7T5kYRgAUvmE9/8o8byCU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FUWo2TzPaKHK/gINHQJQzzDBCEkb1G5hT8I22aulE6bFzqJuYBKsaUcGb9C3TkO77
	 p4a6fbK6G0BJ7uS/Z6ekq2/Hq6rL9ZLWWxqfQGu+7BKcIeo4k6Jxwy9HxFu1lFpokD
	 kInj3jJvJieFeIpRw4T3/eUM9UoTBp9LbxwVHYKI=
Date: Tue, 10 Sep 2024 17:47:56 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: "Kernel.org Bugbot" <bugbot@kernel.org>
Cc: linux-gpio@vger.kernel.org
Subject: Re: Test bug, please ignore
Message-ID: <20240910-adorable-falcon-of-greatness-1ba0ca@lemur>
References: <20240910-b219261c0-9b7ee2b9bfd3@bugzilla.kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240910-b219261c0-9b7ee2b9bfd3@bugzilla.kernel.org>

On Tue, Sep 10, 2024 at 09:45:05PM GMT, Kernel.org Bugbot wrote:
> mricon writes via Kernel.org Bugzilla:
> 
> This is a test bug created in the GPIO/Pin Control component.
> It is created for list integration testing purposes.

One way worked, testing the other way.

-K

