Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8DDFA20265B
	for <lists+linux-gpio@lfdr.de>; Sat, 20 Jun 2020 22:17:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728712AbgFTURr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 20 Jun 2020 16:17:47 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:35621 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728788AbgFTURq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 20 Jun 2020 16:17:46 -0400
Received: by mail-lj1-f195.google.com with SMTP id q19so15235858lji.2
        for <linux-gpio@vger.kernel.org>; Sat, 20 Jun 2020 13:17:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6m7+gpeOkK3Lv52EKBvb5ieDP/yFrERJNboPKgq1eYE=;
        b=J4MWs4ZlPiCtkRlFEjVF0x0va6nMdJv3bwk3cpRdOwv0cDI8kZxFV4p2rpCyU1jOY7
         aAdHzusjPEUqIJvzDGvLoPNFFYsQrszvNxBicmP7gJqYq4qEeDG5HaKbBuS5VsOYITDf
         PWcQnqShbWnJhlysEMv61PzXsb7fEZ0XUY/o7/JpChHfbNLJQFdDsyetEqHU3zmy4AHo
         j+IjCmRxQPkqJEttx2oEpzbj69SVxqKKcB3y/0ffviL6oUpExBoWuGCY0kYZUshKXAs/
         zrtPS3B9cE/Rad5w6COID6EUlFMOi/Fn7tS4Vq4Oom52O/BYtF6prv1AJeH2Aye5wa4T
         BfsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6m7+gpeOkK3Lv52EKBvb5ieDP/yFrERJNboPKgq1eYE=;
        b=Er+qKx2y1NE0UbEz0zkfWUzShfofcHfHfUw7KC7VkTCccqlv+l/GMnRc9gmp/mUBHM
         ckCHL6CyGgX9mmfgH1iRqfbYClPs/En6rKekELltFk9oZ1QMU/l2w32iZFYC9blFZN1V
         OVLRoPu8WYZNE2jKWkuO5+ifQ6//IwW51ZtW+Bbrxp2caq7YWRRKiYH9/ILctTbf9QQE
         5NrmkYx/AogmxeNGyp8Ym7ThzUvJsf9sJ5+rV+gvcnQvBpRfG/P48wd0cAMqGp/si1Pj
         a2B/mNn3VuG4X+gnNeMAQq8sz43pym67H9+yf7IwV6dY2HmpSGzMLqlcbNI9HIWHEZbq
         55Ww==
X-Gm-Message-State: AOAM531f0zxUxZH5H/YPKA1K2lW+ped6UITn2Js0A453oMP38reNUR9n
        Ok1lbZuqMLyEJWc0Bjh/J+2RGRl0i8evyONmDaXtSxJOstw=
X-Google-Smtp-Source: ABdhPJykaEObVR+0S9AD75omN7upramsv7DyP4Y1nkN6kNG0Q/F+YisTVXROXzIqvqRXZOeLusqiEKkZaSEq395PekU=
X-Received: by 2002:a05:651c:112e:: with SMTP id e14mr4503172ljo.338.1592684203622;
 Sat, 20 Jun 2020 13:16:43 -0700 (PDT)
MIME-Version: 1.0
References: <20200610113630.11922-1-gaurav1086@gmail.com>
In-Reply-To: <20200610113630.11922-1-gaurav1086@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 20 Jun 2020 22:16:32 +0200
Message-ID: <CACRpkdaAk+Sh7K5KG_-ygObQ9STUB0v+E7NsRVBHeTBJ6buWBg@mail.gmail.com>
Subject: Re: [PATCH] max732x_probe: remove redundant check
To:     Gaurav Singh <gaurav1086@gmail.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jun 10, 2020 at 1:36 PM Gaurav Singh <gaurav1086@gmail.com> wrote:

> Signed-off-by: Gaurav Singh <gaurav1086@gmail.com>
>
> The pdata is already checked for its validity. Remove
> this redundant check.

Patch applied.

Please put signed-off-by at the end of the mail.

Yours,
Linus Walleij
