Return-Path: <linux-gpio+bounces-12263-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C83A79B3A44
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Oct 2024 20:13:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8BCE8282BFD
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Oct 2024 19:13:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C3FA1DF97C;
	Mon, 28 Oct 2024 19:13:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GoMLvCyR"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 257C918B03
	for <linux-gpio@vger.kernel.org>; Mon, 28 Oct 2024 19:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730142806; cv=none; b=qFuSA2jPQZtdRKbn/n4XT9wNDx66gaeK+uUTMy9ygzz8rPZyVqKFYjfQo0+np3JsfN4Jw/Ix1Fu3h0MCV+4sT5Nl4/PHGaaeIeZbF+ZkuZC7eLz7txtpTJwznlj9yvWcay2ma8J4YRfNpM/ttDCJtdRBlIcYiepFuwLoBjpIO8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730142806; c=relaxed/simple;
	bh=goP/wh/TDY/yG3vZ6ZCOmMByUZPZ2DtTToYHW8f2QhI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LEZqL/Fnckvgmoh78oJxCvrCcp9GYgDBfrhCRu9Dx+9gFnDqSM+lNLfx0OjnuLCBBEY4hLxgnE9eYNdfZZ2GtG0KKEk4jMloJSPgaHq4CnDlkNo4xDus9ikwRKyrsh7qbsATbbxY3RNSBCXP0cbqOukjN/bJouxIjWdSGskLexA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GoMLvCyR; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-6e39bf12830so34170047b3.1
        for <linux-gpio@vger.kernel.org>; Mon, 28 Oct 2024 12:13:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730142803; x=1730747603; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=goP/wh/TDY/yG3vZ6ZCOmMByUZPZ2DtTToYHW8f2QhI=;
        b=GoMLvCyRznvneGVuWdQpGLfE3mgMoDysynb5YFGPE6zFzniKFIsnEz9XI41XDtn4iG
         KU8L5C3dt3rDUTKaua6FWWRBM9MuQ8v1dyQYU+VwHNmVuOuYTw5ykRrXv/YFhvl/piue
         qzSGZWWi2jnCi/dRGjhFu23yoWP1Xa+JHrVLLZaE9NYw+xlQfBOKTbF2H1NBTkzxu6qi
         eTSBQcXa9h8aV+FyfQ1fd/TIL6qep4Vc4IvTiFTzJWGn25vCE4S5oL8DXyPUyqWdgV9E
         SazjyuBGW/AfOzSvqFci4c9K1r4qgkm5TqVBwhdixRAFoEMK5p/r9Ekd2poNAlhidkOW
         /g1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730142803; x=1730747603;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=goP/wh/TDY/yG3vZ6ZCOmMByUZPZ2DtTToYHW8f2QhI=;
        b=TBU2WioONNYgDD+dwznLtoFsYg5filDgA1ue7Hnlkzl12jbIOoC7FsGfTCHPI/fpbE
         pyDvhMAFxwZJSUH7uSepyzuH2C5WdauYqoWpc6qzE1mD9e/1CcONHi1wG2D2vSCyWSdN
         dJALIiE21fTN5fz/QiRax46hiyWWW9wzSDWGjC7u/hNRhuvFzBGUX6aGq6jpRMqFH9N+
         LnccWXgjc/kS/Xo79AWDFAX1S7NnHNfReXRFJbfXXuQw8ALuwd5wrHVPMOv3L+RVXb9Z
         wErtCOWAWF47PCjw1vQP5ANNLwISJydf6WOd7RyeFkctXR6903vGrE1vA9fc5AJc7LG9
         RfLw==
X-Forwarded-Encrypted: i=1; AJvYcCWXwd1e/uYqoktZz9RWFHOGeZYe2iVku8ib4+vIsGGwUftrrure89/xF3yPX5FSI1tF7unmraI3jXe4@vger.kernel.org
X-Gm-Message-State: AOJu0YzIH8Vlf50u2viS9spCl61fWpEXYYqU107N0vczMl+3vbbKFgPT
	WDwRvwlDym/lZYLAMDvgXucGNHN3q9Cy4+ulpz8cdO2sePGJrIpaUPmpH6tG2bJzpb3MZvSbfMu
	zaO/3GA959yMV0p0yXX8rIj3TJHraf2z4fzTuGdDJOTaig7dgZmo=
X-Google-Smtp-Source: AGHT+IFIhxhFuf244saHldQ+VgijlcIWn8BifysTxuZ9W6ZMAz2z4/jF5lzgTDhMKZS327YW4KFYweJieRnVWHrwHJM=
X-Received: by 2002:a05:690c:4441:b0:6e9:e097:e9d2 with SMTP id
 00721157ae682-6ea22d45a79mr8867217b3.6.1730142803096; Mon, 28 Oct 2024
 12:13:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240812-dbus-v5-0-ead288509217@linaro.org> <20240812-dbus-v5-4-ead288509217@linaro.org>
 <93c9d617df7cc3f6814a56d07d90aa3f98e352f6.camel@siemens.com>
In-Reply-To: <93c9d617df7cc3f6814a56d07d90aa3f98e352f6.camel@siemens.com>
From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Date: Mon, 28 Oct 2024 20:13:12 +0100
Message-ID: <CACMJSetD8JeP+5AV9tcGXPVQQaUO=e3bG6ZNVd82kdREOqXUJw@mail.gmail.com>
Subject: Re: [PATCH libgpiod v5 4/4] dbus: add the D-Bus daemon, command-line
 client and tests
To: "Sverdlin, Alexander" <alexander.sverdlin@siemens.com>
Cc: "brgl@bgdev.pl" <brgl@bgdev.pl>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 28 Oct 2024 at 14:07, Sverdlin, Alexander
<alexander.sverdlin@siemens.com> wrote:
>
> Hi Bartosz!
>
> On Mon, 2024-08-12 at 10:22 +0200, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > Add the D-Bus API definition and its implementation in the form of a GPIO
> > manager daemon and a companion command-line client as well as some
> > additional configuration and data files (systemd service, example udev
> > configuration, etc.) and test suites.
> >
> > Tested-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>

[snip]

>
> Strange, I'd expect from this code to detect pre-existing chips immediately,
> but this is not what I observe in practice:
>
> $ gpiocli info --chip=gpiochip0 | head -n 1
> gpiochip0 - 24 lines:
> $ gpiocli wait --chip=gpiochip0 --timeout=1
> gpiocli wait: wait timed out!
>
> (without timeout it would wait endlessly)
>
> This is not expected, right, otherwise it would be counter-intuitive and racy?
>

gpiochip0 here is the device name. It's dynamic so you cannot use it
with gpiocli wait as you cannot know it in advance. You need to use
the label of the chip instead.

IOW it's a feature. :)

Bart

