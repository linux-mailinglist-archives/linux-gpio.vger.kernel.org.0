Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B9A82540CF
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Aug 2020 10:28:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727969AbgH0I2R (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 27 Aug 2020 04:28:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727048AbgH0I2Q (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 27 Aug 2020 04:28:16 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D632C061264
        for <linux-gpio@vger.kernel.org>; Thu, 27 Aug 2020 01:28:15 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id m22so5448798ljj.5
        for <linux-gpio@vger.kernel.org>; Thu, 27 Aug 2020 01:28:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0v2ljzAsS/Xt/cCoXDfRSkq8ULfQZGldE7AEfFXvCjs=;
        b=aGb3OAA9CcMElaoxNxXqL502T3CzkOt/Emegbls6A1q3+vz8iFJYTVWQ1I0MCSHoen
         FAwR3s782EZtnWWA11bKcdJ4Nw1PaqALzNgJNViMSdPjeIKiB+Rh6AV8YZQZqTdJHD3I
         ne8iSox3RFG2m/ks2Qqf8MD/pkaW8YHcY9/dFycMhmEeGR+h5kyUaDiYzXrXa88c4aKn
         LSBOi0C9xzg5xE08iId/LiSJmEjqYy5936QZf9L4IqWdBLrmX6ha3SOcdx5BpWMXPJC5
         Ht/WFvAHKTSargOBhkp6f/T2RdgG2PLnE+/9bwhd7w1gqtzqwsUf2Ueuo8FkYOx5AOIZ
         FEHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0v2ljzAsS/Xt/cCoXDfRSkq8ULfQZGldE7AEfFXvCjs=;
        b=qlk0mgNcjqrdS8qqLSmrS8kHPOVqNtpbY5LZu5UNIWtACB+lQ1cp4hteBLVPsQ7g04
         qmt9qIbu8UHPr4hthIbvM7C3DRopTLr8wY5t9OZT8Vu6HaaVzquGfCFDvFkppp4gknkw
         UTjSsGWAW7Cz02Gk4A6adcYgW/pm5lMP8w6wtZ/VMYt5Kcr+M12imrzM+uc/mK1+hAWf
         Ss3u78DteRPHsVOpa9doCyKYzphRQz7hCROGMLcTz/xFYJjM5yNeC+t2YOL4LOPH2YRb
         hwcxo5eHH4ak5t3mCN2DQeGnUiUIwPt+fpsP1BQWFhsWOWiPzvmBNyp7A2GEY9hKzEps
         VPvQ==
X-Gm-Message-State: AOAM532VLVemfMRMrIZvKoqvAJRny3AVF451ESUYJf13rh7dNYGW7ers
        45tymDL6Syx8Lr/0kr38jsH0uRt03RJdJ8w4ke17jA==
X-Google-Smtp-Source: ABdhPJySYjCmw8sP+FL4orhUpQLDoKe3n6IZoSSGVjYtA1A+pVw5tpNelFvp4lYWQi3L48xAg5EJevvcWh5wGXaVZXQ=
X-Received: by 2002:a2e:6a17:: with SMTP id f23mr8349136ljc.338.1598516893837;
 Thu, 27 Aug 2020 01:28:13 -0700 (PDT)
MIME-Version: 1.0
References: <20200716205530.22910-1-bartosz.dudziak@snejp.pl>
In-Reply-To: <20200716205530.22910-1-bartosz.dudziak@snejp.pl>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 27 Aug 2020 10:28:02 +0200
Message-ID: <CACRpkdY7GgKGvsZtL-Wc4vRbN7pTAoXSAgym31QM8bJvxNkn_w@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] Qualcomm MSM8226 TLMM binding and driver
To:     Bartosz Dudziak <bartosz.dudziak@snejp.pl>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jul 16, 2020 at 11:29 PM Bartosz Dudziak
<bartosz.dudziak@snejp.pl> wrote:

> Binding and driver for the Qualcomm MSM8226 TLMM pinctrl block
>
> Changes in v2:
>  - Changed node name pattern to '-pins$' in qcom,msm8226-pinctrl.yaml binding
>  - Expanded example in yaml binding with a 'serial-pins' node sample

No comments on this for a month and uncontroversial so patches
applied!

Yours,
Lnus Walleij
