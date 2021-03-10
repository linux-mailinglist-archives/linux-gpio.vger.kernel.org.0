Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 92CD1336810
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Mar 2021 00:48:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233894AbhCJXsS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 10 Mar 2021 18:48:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234066AbhCJXsB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 10 Mar 2021 18:48:01 -0500
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92E1EC061762
        for <linux-gpio@vger.kernel.org>; Wed, 10 Mar 2021 15:48:00 -0800 (PST)
Received: by mail-lf1-x12a.google.com with SMTP id f1so36622223lfu.3
        for <linux-gpio@vger.kernel.org>; Wed, 10 Mar 2021 15:48:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kRvHS9o5dMLT6f5yfgrvrgY38oLudE/U5A4iFNm6Au8=;
        b=iNrRn08C6u6wm9/NWOjycwj9HSvpAmM5+og002MFmZagOZwJW/7mrsRDnTGETT1tW6
         ofpe9swHZzRRGPwfWFG/pgGOlBDYcFDnyxi9fHhJ3SS6ghK+w/ham9nZWPqLc18RH4lD
         tRWZSiEut1qDfamOLDJam2Rn2B+gIUwvVOtq1zGIPnSpYgTYNYlN6e6Yxz7eMGVqRnro
         Ox2Sof2CKCiSwyXXXiEWIzRseCm6nB/7WoEi4mIGNqG1w8Wi2/HBAPf5Ym7+GCX5VY+n
         aIL7DuV6/sbDWbA4uUhog1FBJXkWHaVbpursDstZGbIUdX1ov+MH3m4vmrXgmTYqJqD3
         O1Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kRvHS9o5dMLT6f5yfgrvrgY38oLudE/U5A4iFNm6Au8=;
        b=qGajWgyJ9PIE8+creBMaX0sVeF+iqQ5YnQbU1Hq5G/qBAxFGAmUdrDa+Kn8ReI55FZ
         Qj/6AV3Tc8F/1ZqkjSuVFy8CZ/I95lzomWMBly4b9NRlE77VqzNHxGWgMa8EntrCQT0s
         24jiQRcf6EtK8A4BpHBRQFuW6DAAndnsdqRAQr9+MfHsj/gcxxX99O6qOhV/o4n5wzEJ
         lv358yjC8tXilxtFEWQAXUHRQ1BMZws/8s69njqMSZF58xS1Hp5y1iQkvkMJIa4V9f5A
         tAtziIf+fM8phuNRiq/utHpAiagNWAl2WkGmkf/Tt5kc6Dd86DetOtub9Q3mNCtnX9jh
         92uQ==
X-Gm-Message-State: AOAM532EiB5p/sZyPpwGLhj9ybjbX3XYVXaTY1N7WcKVjVPqyrjt+IJn
        7I+61lPnGcxdZx547N7uRmv5Xsjk9+s1b9jIDqIeDw==
X-Google-Smtp-Source: ABdhPJz0squ0Ye3e/PiQIDYAcOJXAgc8W4xsitrsSru2AMgkDx47v8y6PLZPozsGXf40w2FsskuwPuAGjhSxg9qCrgc=
X-Received: by 2002:a05:6512:74a:: with SMTP id c10mr571356lfs.586.1615420079060;
 Wed, 10 Mar 2021 15:47:59 -0800 (PST)
MIME-Version: 1.0
References: <20210308164845.3210393-1-vkoul@kernel.org>
In-Reply-To: <20210308164845.3210393-1-vkoul@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 11 Mar 2021 00:47:48 +0100
Message-ID: <CACRpkdbOY_ZuL4YwkQy1dCDn_USEDy1+F1EUooNTtkXDU0zBDw@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: qcom-pmic-gpio: Add pm8350 and friends
To:     Vinod Koul <vkoul@kernel.org>
Cc:     MSM <linux-arm-msm@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Mar 8, 2021 at 5:48 PM Vinod Koul <vkoul@kernel.org> wrote:

> Add support for the PM8350, PM8350B, PM8350C, PMK8350, PMR735A and
> PMR735B GPIO support to the Qualcomm PMIC GPIO binding.
>
> Signed-off-by: Vinod Koul <vkoul@kernel.org>

Both patches applied!

Thanks Vinod,
Linus Walleij
