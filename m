Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C532827728
	for <lists+linux-gpio@lfdr.de>; Thu, 23 May 2019 09:37:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730327AbfEWHhg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 23 May 2019 03:37:36 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:42174 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729866AbfEWHhf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 23 May 2019 03:37:35 -0400
Received: by mail-lf1-f68.google.com with SMTP id y13so3619974lfh.9
        for <linux-gpio@vger.kernel.org>; Thu, 23 May 2019 00:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cx8kg7WymCjtyRcPfqK4zjuEJ4lhy55B2Gkin5DJtFU=;
        b=fR8RE84n1odppI3p20OTG7XaGgUYqo6kXCldCRW8or5Z3hIBeoEMGNKMB5ZPtdNJk/
         mgByEQfAV30URjnhve0FLDZCf3VjYeJTLxrXOtpebu/WgWJa95xV6q/bzJIWfQu5kAM/
         lb+2YJRaFCyI9zlUIgxWbqOGBQ8GH9WL7wLHOn/TeVF16dYN8cUyFpGCJTNx4/m3BA6y
         WhJFolJShRdIpJ8lYYTZrjQzkt4A0fSuH6IOy7MSadTiKYexx/vuh+O5dw6MVcnvh0iX
         6FmVEvoLxExnr+FvKCG/9HFdK3pBLFR3kjTdxjnhyNRcvh8Flzh1gs9FGLySsBOjgh/R
         +vAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cx8kg7WymCjtyRcPfqK4zjuEJ4lhy55B2Gkin5DJtFU=;
        b=ptLxE2Ba2jhfNTNwzdl5n/GNNy05fR4H+qpU6WUotgDUVb/NnSJqcPHD/V3K9w1+G8
         6hn0/OiW0zSC7JjJV6qBOI/7tsABGTo7f2TWS904bh4PIyUqICMpRCb+T6aaKfJoWa5k
         sWWErkpiVfwksePCUM4GLB9DebM9sd3Cu+CItR/opXrR5AhpD9JbX6gizwlu1DfspvH8
         lBJr8wXOTb870KjIRLDzVgY/UdyTUXYeK5lNVDSvgFu4Kiy2WNQHqDijA/YixTwBfVmm
         oaVU1V87pTD/P9n+RpZp5glcngdNB5l0z5efIfFuoix28yn0EWYd7XowPb80JSRwBCIO
         W1HA==
X-Gm-Message-State: APjAAAWK9CKprKMU91U5Rz6UOrTmyxNq17X+o/GIHeNKGSxso+Wt+UvM
        P5s7SpAqiqaOkZuR8+8zHTGeoQbhrToiGAF7gVn44g==
X-Google-Smtp-Source: APXvYqyBRsqXPk9Dhzbeg2Oz3JZyzA3NjwECl9TBODwCZZrOK9/RFjOdjOlwiSIFYgEUEDYHs19a86bibzY+Aklnf3E=
X-Received: by 2002:ac2:5935:: with SMTP id v21mr4885287lfi.117.1558597053613;
 Thu, 23 May 2019 00:37:33 -0700 (PDT)
MIME-Version: 1.0
References: <20190522152925.12419-1-benjamin.gaignard@st.com>
In-Reply-To: <20190522152925.12419-1-benjamin.gaignard@st.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 23 May 2019 09:37:22 +0200
Message-ID: <CACRpkdYOS0UrXPtJb0--4RW6QM_Xq8wb=9Gj5X9fk7JWCgpWfQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] Allow pinctrl framework to create links
To:     Benjamin Gaignard <benjamin.gaignard@st.com>
Cc:     Alexandre TORGUE <alexandre.torgue@st.com>,
        Amelie Delaunay <amelie.delaunay@st.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        linux-stm32@st-md-mailman.stormreply.com,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Benjamin Gaignard <benjamin.gaignard@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Benjamin!

On Wed, May 22, 2019 at 5:29 PM Benjamin Gaignard
<benjamin.gaignard@st.com> wrote:

> Some pin controllers may need to ensure suspend/resume calls ordering between
> themselves and their clients.
> That is the case for STMFX (an I2C GPIO expender) which need to be suspended
> after all it clients to let them call pinctrl_pm_select_sleep_state() before
> perform it own suspend function. It is the same problem for resume but in
> reverse order.
>
> This series allow to let pinctrl core knows if a controller would like to
> create link between itself and it client by setting create_link to true.

I changed the name of the boolt to "link_consumers" and applied!

I will send patches for all other pin controllers that are I2C or other
slow bus based, as they will definately need this. Let's see what
happens!

Yours,
Linus Walleij
