Return-Path: <linux-gpio+bounces-9800-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F51996BFBA
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Sep 2024 16:10:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F1A152864A7
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Sep 2024 14:10:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF5D31DA610;
	Wed,  4 Sep 2024 14:10:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PFrhbTA9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 730D11D9D70
	for <linux-gpio@vger.kernel.org>; Wed,  4 Sep 2024 14:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725459001; cv=none; b=jAcQOsr9sFKcXwYpq9LU3uf67h67uHgA61WctkuLyt5+H0JFU1GSaY9/iag+nDiKzB9Dlc3AREIvo6mCxeHzgQmA5XOyBPTrCUUiwprBY3UN7czTHtVjiCk+YCsnboo58h7BHC19jflvmGZwsjdYiQmIHHJuBYz4SThW+aImtFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725459001; c=relaxed/simple;
	bh=XKIEj/F4+Fiv+sphbvnDHQQehuI3fMUNkdx+qcjlkVU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JhXVYbI36tnxATVkhClmCqljUWIPJ+WYMgglcJDJPqMPhCxw76cpk9TUzg0lbVtPYycTIWUGsj6c6EOWdx2sSWSQP3QiopKNNRjDSgX9ruPsRZ/yIBcgxbHstfXC7cZ/g7JARXnQq0brt+nmsTIdHYWuMJNPf0krcjTbacI3+7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PFrhbTA9; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-7b0c9bbddb4so660764a12.3
        for <linux-gpio@vger.kernel.org>; Wed, 04 Sep 2024 07:10:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725459000; x=1726063800; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XKIEj/F4+Fiv+sphbvnDHQQehuI3fMUNkdx+qcjlkVU=;
        b=PFrhbTA94bpaWHpe5V47XBXNYzeHRK7Vhjb8HBmmOrvZ2Yzw76blZiZXaJPYOklcXi
         i3qGczkTjv3o1z5216G0eNYfoQtvM5KeHlZT9UxAWtwaC/l98S2UfjTyBawl+o6sXBkD
         xMhidmU3vR4+/EGpcfvq7DPVVGnQu2BD0mXFuqYJfLYlMAsRnU1yPfeDOO9QMzEGCpq1
         Pk58+rLJaO2DaLkzrlCbYqnfKZO/4VgMgQ4ejgnkrukRF69FaQPw6F4cl8B1i7f3giQL
         m2g34gL8FupW/5L9K293sXer/pth7OLOLGrkZUN0zb+qMLE6Dwyb4hMcTkc4sajhtNxa
         0Gig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725459000; x=1726063800;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XKIEj/F4+Fiv+sphbvnDHQQehuI3fMUNkdx+qcjlkVU=;
        b=MdsGoI7UghZgIpUSW2WYRFVb61AR3YfpsoN1nmcfcq9Gh9/hI71l60HX48M6YWWJjF
         ki2EaGAPNeRRjRDeV91LcjM47yBbs6Ov0yUkzTaGqsWDqutN7NiB75UAx9v3MhZABVJr
         QqnbzOys0m7nn/NgyyJbhiC20X3Z5EyWE2BKOzNh1g/CUPZnlIWlYpyrVVrgLiwi7J+K
         41ReLOBJz+uK4rxZTuxiUdoq4zfjUZTbkGDZccgfItE1ytkD6pABBeQXR2b6ZcP+x5Q8
         fTUw/Q+l5ziE0LeqkZxBDEbUZhXO4ehVE6zJIth4rtYJ34qO68veh+yEptcQUPH3uBzZ
         maaQ==
X-Forwarded-Encrypted: i=1; AJvYcCXNo9vFjFlw5P1wDsGbXvlKWmBr5mbnsHUF03phWWV7AlOV8bMLDdKRByYmVambOPeSecEaBALt8pwn@vger.kernel.org
X-Gm-Message-State: AOJu0YylsJFmDsDeysUsZ4uGx2xUJ6V1/d6cNj/NWf9Cl0jk2NjQRSKu
	cZ5EM59H7VMMqy1lbtd3sF76K2qWMNfdnNyPdi8xJiN7Tv9N4Rjj2MeeEw==
X-Google-Smtp-Source: AGHT+IFdzWuW5cRgEHjOOafB1ecot9lrAOQjAxAF+pN9OscGroEBdbGGfKCDYgcaK1De9CUSJl5irA==
X-Received: by 2002:a17:90a:4dcc:b0:2d3:dca0:89b7 with SMTP id 98e67ed59e1d1-2d85617bc40mr24624829a91.3.1725458999465;
        Wed, 04 Sep 2024 07:09:59 -0700 (PDT)
Received: from rigel ([203.63.211.120])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d8f308b8ffsm5670587a91.4.2024.09.04.07.09.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2024 07:09:59 -0700 (PDT)
Date: Wed, 4 Sep 2024 22:09:54 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Douglas Silva <doug.hs@proton.me>
Subject: Re: [libgpiod][PATCH v2] build: imply --enable-bindings-glib for
 --enable-dbus
Message-ID: <20240904140954.GA311523@rigel>
References: <20240904140127.58667-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240904140127.58667-1-brgl@bgdev.pl>

On Wed, Sep 04, 2024 at 04:01:27PM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> GLib bindings are required to build the D-Bus daemon. Enable them
> automatically if --enable-dbus is passed to configure.
>
> Fixes: a5ab76da1e0a ("dbus: add the D-Bus daemon, command-line client and tests")
> Reported-by: Douglas Silva <doug.hs@proton.me>
> Suggested-by: Kent Gibson <warthog618@gmail.com>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
> v1 -> v2:
> - make the changes actually work
>

That works for me.

Tested-by: Kent Gibson <warthog618@gmail.com>

