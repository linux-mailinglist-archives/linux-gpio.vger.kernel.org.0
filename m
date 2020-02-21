Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 51A7F168176
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Feb 2020 16:24:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727053AbgBUPYb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 21 Feb 2020 10:24:31 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:45455 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728985AbgBUPYa (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 21 Feb 2020 10:24:30 -0500
Received: by mail-lj1-f193.google.com with SMTP id e18so2552432ljn.12
        for <linux-gpio@vger.kernel.org>; Fri, 21 Feb 2020 07:24:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Q8F1pecknXeZPAGHPwSdHXa2S1HIMEUTEL9qK4pfGkI=;
        b=rxD7B9dqoAiPCPgcPMy3dxnS+3dsZtb0ZYOiZpv7dDIPGvwW3EUh2Y3DvQo/1IuVPB
         B8aCXt3Mbu5JD28DX63Op2V8OkUo8EMGp1u2VcbnQ7vL7goA2vrBUZYCagZosE8dywvW
         Rq1sB1XaqIPDkeGnN0NYXhMQ2QHImd7ijNGmGMyHOQ9ms7ngm6Xn8Qs51/6xbb7mNWU8
         jfVmfeRZO6Mi9nYlrM/p3bSU7gqnhDN9fncaCFUwbXNMTD4sxPCOu62OzH6LrtZgz2oc
         m2DItFi4GJvVvf9V61Qc+jAKPUtgovjrhmeloggKXeeOvSgcj386SgdPSjWybppU2d59
         Z2hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Q8F1pecknXeZPAGHPwSdHXa2S1HIMEUTEL9qK4pfGkI=;
        b=W2kS2Nli0+iuG/+Mclxxp9pe5SY5PfSvRWdMISb8s515D1PRxWrx4UIMgP57Pou1ce
         Ih3xIB9jQwMHsdW5HGlJmKRZljzoLhUD2/+h5umOtMrlE4sseV501Z3SXV9CUs0PVBKI
         Msr5ZNIhD2TFEVmpYFc6e9jtQQ6MoJQClZpLaWv/uhe8wFGenuj4eUCTgmCtP+vIsjNh
         gCT3jYIaI3YLXLNSAyK/wyuL/d9Ml17RlzrGeQn0bhxLj2Qj7p4XfLK8SJ1BwUkGGWbv
         4pnyJHrZiBpJnAhmMXZ9ZPchA7ShkP/8GkielpEJznJGIpXzfdvu5G2PlGDkhswvJ3aO
         POKw==
X-Gm-Message-State: APjAAAU8ZC0gWe4wfejjSw5Q5Hqqzh18tVpSJtHVVD4Bt4SBT1lj3odu
        NjJ06TqoC4WGgKmuAwkbeEFkgE+Y0qKd9P1AySQwBm3JJMo=
X-Google-Smtp-Source: APXvYqziIUztxmcLeCs99putNp5eHfPKwvYYqzEsStcEDA0FthIqEITMkvuS+XoCG6v5robD0BZiVwXwVCyqWa3dCL4=
X-Received: by 2002:a2e:b6ce:: with SMTP id m14mr20900215ljo.99.1582298668773;
 Fri, 21 Feb 2020 07:24:28 -0800 (PST)
MIME-Version: 1.0
References: <20200219175940.744-1-ansuelsmth@gmail.com>
In-Reply-To: <20200219175940.744-1-ansuelsmth@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 21 Feb 2020 16:24:17 +0100
Message-ID: <CACRpkdZfHRuPwM8uFnzAYwCe3WeURPwX06arrZi+70aOwbcdGQ@mail.gmail.com>
Subject: Re: [PATCH] ipq8064: pinctrl: Fixed missing RGMII pincontrol definitions
To:     Ansuel Smith <ansuelsmth@gmail.com>
Cc:     Ram Chandra Jangir <rjangir@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Feb 19, 2020 at 7:00 PM Ansuel Smith <ansuelsmth@gmail.com> wrote:

> Add missing gpio definition for mdio and rgmii2.
>
> Signed-off-by: Ram Chandra Jangir <rjangir@codeaurora.org>
> Signed-off-by: Ansuel Smith <ansuelsmth@gmail.com>

Patch applied with Bjorn's ACK!

Yours,
Linus Walleij
