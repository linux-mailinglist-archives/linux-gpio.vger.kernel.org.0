Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 88F8F28F1E0
	for <lists+linux-gpio@lfdr.de>; Thu, 15 Oct 2020 14:13:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727571AbgJOMNS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 15 Oct 2020 08:13:18 -0400
Received: from mail.intenta.de ([178.249.25.132]:31084 "EHLO mail.intenta.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726513AbgJOMNR (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 15 Oct 2020 08:13:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=intenta.de; s=dkim1;
        h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:CC:To:From:Date; bh=U5aQ61EWYPH2FHtYEVFAj/z5UjciAGLjB+xHx/TAOJ8=;
        b=W6IhIfDtM9k3vOUSOt0Rk+LnC814iyfp++W/nS6VQI8mzY2LrPFDZOMdgTW2JTA77U95ELYB++btlpx/BcOcNFA/FH08p3ql5Q319F6UCYJzkhywm6Q8GWA0epqqV4YPHu+NhKUW9w448J82KwMSWzejiw4c4+S9C69utvh/Opj3kgnaiVMKBsD/v3yUvVxErp8xEHJfvlTPudBkQM9yp8geP+3w+wFrrEp7SDFL1nOnG4/G4+UjdJFxkdGHmxIAp5xGrs8QJumBRMwodIKGI5hgyYnhdE9GjwubRNmUNym3bjpLx4Xmi+o6jVh0LICR6C3pk2tAGTBA1JtgXPlPXg==;
Date:   Thu, 15 Oct 2020 14:13:12 +0200
From:   Helmut Grohne <helmut.grohne@intenta.de>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
CC:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "Bartosz Golaszewski" <bartekgola@gmail.com>
Subject: Re: [libgpiod] cxx bindings: time_point vs duration
Message-ID: <20201015121312.GA7166@laureti-dev>
References: <20201015083805.GA10354@laureti-dev>
 <CAMRc=Md=ZeKLS-SKKgmq+V9VCt+7xdjNiwz89Ms-vOeTcwZBOw@mail.gmail.com>
 <20201015093526.GA10891@laureti-dev>
 <CAMRc=McpnnK9NydujR=YRuy0ZBLhQqz3SSZ5eeisjqhMPUbMhA@mail.gmail.com>
 <20201015105718.GA11027@laureti-dev>
 <CAMRc=MdWi94uzYb6OprmVoGnfmSHUCevqAPPgXOPHQNVrj0jfQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAMRc=MdWi94uzYb6OprmVoGnfmSHUCevqAPPgXOPHQNVrj0jfQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: ICSMA002.intenta.de (10.10.16.48) To ICSMA002.intenta.de
 (10.10.16.48)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Oct 15, 2020 at 01:43:32PM +0200, Bartosz Golaszewski wrote:
> Well, it's a long story. It used to be what the kernel calls REALTIME
> clock, then it was changed to MONOTONIC and now there's a suggestion
> to make it configurable in v2. More on that here[1].

Ouch. I was wodering already as the timestamps looked like REALTIME
here, but I'm simply using an older kernel. In that case the type of
your timestamps should depend on the Linux kernel version, which is
impossible to do. All you can do now is lie for older kernels.

> One question is: even if on linux the steady_clock is backed by
> CLOCK_MONOTONIC, is this a guarantee or just implementation? And can
> we rely on this if it's not defined?

Like the nanosecond resolution of steady_clock this is certainly not
guarantueed. However, it is rooted so deeply that it is very unlikely to
change. In theory, there could be a chance of changing it to
CLOCK_BOOTTIME. I don't think anyon is going to try.

At this point I recommend going with steady_clock.

Helmut
