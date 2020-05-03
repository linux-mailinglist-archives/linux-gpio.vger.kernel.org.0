Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D92FD1C2AA3
	for <lists+linux-gpio@lfdr.de>; Sun,  3 May 2020 09:53:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727067AbgECHxI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 3 May 2020 03:53:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726884AbgECHxI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 3 May 2020 03:53:08 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62D8AC061A0F
        for <linux-gpio@vger.kernel.org>; Sun,  3 May 2020 00:53:08 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id x77so3969003pfc.0
        for <linux-gpio@vger.kernel.org>; Sun, 03 May 2020 00:53:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=ldpXdu9wYcJl6tutqoAvH09RnanV7SWXIgtXP1Sfuoc=;
        b=L/Khb9Wky21XmwJo/DL8Q9JkLt/J6PBECd2JEVqz2moAu5l9e0/qSeqUeMmYHOtMTq
         VS8g0MZ/Xu/2GYn7ztNbhY+hLCveQ9aJUWcYaC4xjyKhSzAXRKvBNgLPQiBn9jKbVcbg
         6sByq9qYKzTNW+OAComF8MKbCzkUAvqRLUJw8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=ldpXdu9wYcJl6tutqoAvH09RnanV7SWXIgtXP1Sfuoc=;
        b=pDWiuYPtRPEMtaP89D2V5AgLf5KaV3Kt/bVlFaUUN4jcOWWbIUETfCTGvgBH9LkH6G
         SLJu0NomRgSwRfJTyvB/O+B+rrzGLemrGRIKyKI6RMScsNnyDAFPS1H9TQQk6JFJlj0h
         A81th+4H/peOy7MMYD+E287KN9yUO1XHG5A8erZvz25rzTnal4WHgNeQIkKcMP2XZ08w
         sw01tIC92m3Z0NAOzGvUsUsoLjwE9DG4p1xR+p/dcpOVw9KHGtvbqk0t7ITVJCGHveu+
         k+4fUD63+cz5kRLD80pLSY1WScAwe09cZKy0DU1ZWZ+e9HrJm9ffDktG8xY/3BQTzyIZ
         uz0g==
X-Gm-Message-State: AGi0PuY9f9/1O/o2ubM0gRF69aH6BQfwsfZjLIvJh6pE499iuIeLfsxX
        GCHhnEJkfi3OcZQ+LsiyPb1o9w==
X-Google-Smtp-Source: APiQypIoEWlcADaqg/kWvVCnzwRszaN6EYULaM8oFqBYjbXts2j4JYT5pxcegrCsrGfewc0Ov7o+zg==
X-Received: by 2002:a63:4e64:: with SMTP id o36mr11993398pgl.167.1588492387053;
        Sun, 03 May 2020 00:53:07 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id c80sm5909156pfb.82.2020.05.03.00.53.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2020 00:53:06 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1588314617-4556-1-git-send-email-mkshah@codeaurora.org>
References: <1588314617-4556-1-git-send-email-mkshah@codeaurora.org>
Subject: Re: [PATCH] pinctrl: qcom: Add affinity callbacks to msmgpio IRQ chip
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, dianders@chromium.org,
        rnayak@codeaurora.org, ilina@codeaurora.org, lsrao@codeaurora.org,
        Venkata Narendra Kumar Gutta <vnkgutta@codeaurora.org>,
        Maulik Shah <mkshah@codeaurora.org>, maz@kernel.org
To:     Maulik Shah <mkshah@codeaurora.org>, andy.gross@linaro.org,
        bjorn.andersson@linaro.org, linus.walleij@linaro.org
Date:   Sun, 03 May 2020 00:53:05 -0700
Message-ID: <158849238505.11125.459527469872237748@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Quoting Maulik Shah (2020-04-30 23:30:17)
> From: Venkata Narendra Kumar Gutta <vnkgutta@codeaurora.org>
>=20
> Wakeup capable GPIO IRQs routed via PDC are not being migrated when a CPU
> is hotplugged. Add affinity callbacks to msmgpio IRQ chip to update the
> affinity of wakeup capable IRQs.
>=20
> Fixes: e35a6ae0eb3a ("pinctrl/msm: Setup GPIO chip in hierarchy")
> Signed-off-by: Venkata Narendra Kumar Gutta <vnkgutta@codeaurora.org>
> [mkshah: updated commit text and minor code fixes]
> Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
