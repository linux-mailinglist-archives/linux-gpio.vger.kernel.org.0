Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 73F5747CB3E
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Dec 2021 03:04:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238496AbhLVCEW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 21 Dec 2021 21:04:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232493AbhLVCEW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 21 Dec 2021 21:04:22 -0500
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com [IPv6:2607:f8b0:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 144DFC061401
        for <linux-gpio@vger.kernel.org>; Tue, 21 Dec 2021 18:04:22 -0800 (PST)
Received: by mail-ot1-x32e.google.com with SMTP id w6-20020a9d77c6000000b0055e804fa524so877342otl.3
        for <linux-gpio@vger.kernel.org>; Tue, 21 Dec 2021 18:04:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Al9bVe7ZlBBHxflPN7dDbRiQZxeGn2j4XWyGYUriWq4=;
        b=mlBAw9YdE/jogBzhUlrHKbx2cOXg5XI0v+CxuCs2lnBROr9s9cu+pUB+KQ8CzijjKq
         t9k/Xeeh3M7aUPlNUjMNfkDXxlKjRCUaTVQvAYgBxJp0TQZruoa2JjQKVSXplDS90yI/
         +0+v3XJHhw7ku3kr1ufQL+oZbL4HU0hrQCmF4vm+rdYPMDl/MXtd9b3l0z4QyTKJwnWw
         HkLXg6x54/+dIlkkY0L8eZQZFyOLmSuEyePf8QrUsKCpo+rUHzkmwdl1Et+AdjXjpIgy
         ZOrcCkOXfg4mss29mb1L15b8oNP25/5vAZjUvKanLdBsD8a38ECCTixEDylDsDB8gSFx
         uB7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Al9bVe7ZlBBHxflPN7dDbRiQZxeGn2j4XWyGYUriWq4=;
        b=QdfKhBKYzeX6cu9378k8MC3pQu7qdtg+OH7xHl0w5Pdw4r0T8QKTJ8NEuX7wIubU3v
         o5UncuYW5qJUK6Z2UZhHkAYfWAgjRfYy9oGOY6ZQD19I3fKwZbXeWFuHzV/i36B2+8N0
         30i9ZnpArpRNBjCt0i9nnkUQVXuwrPmnjM7EmCfqpJNCh9nhz14NeX0kRoWQxD2IHWUN
         O4j9VL54OGRQ1VWlSzXWMukGP8B8rQF40PpSI5Jt3513B++oGpBVpojGzh924NOaxx6v
         YfiK5D/FJjVpmJc6s4kME/jkdunWAwXUXF01VKeacUVbKtPCsepjtrl06nY9GAxIk/5R
         e5qw==
X-Gm-Message-State: AOAM531sv7Xhvd5m3yH/mDBBukEsF/3jzH2O00gjR0vb5WlXq16sLhFx
        qe7H3SfLs4LzuxM9VJndaMlgYIbmEckIt9iKCAIYXg==
X-Google-Smtp-Source: ABdhPJzP8xGfPla++awyn1G27r3LXkIK3wvrijkd0Yt2tCqMYT1XZqk96h9xZY+z6BFU5GitM9gSj9v4Yy16fmVlvh4=
X-Received: by 2002:a9d:74d0:: with SMTP id a16mr708127otl.237.1640138661156;
 Tue, 21 Dec 2021 18:04:21 -0800 (PST)
MIME-Version: 1.0
References: <cover.1639696427.git.quic_vamslank@quicinc.com> <ff9abf953c274a1e34f59114642f67ecf02acb6f.1639696427.git.quic_vamslank@quicinc.com>
In-Reply-To: <ff9abf953c274a1e34f59114642f67ecf02acb6f.1639696427.git.quic_vamslank@quicinc.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 22 Dec 2021 03:04:09 +0100
Message-ID: <CACRpkdYR2e3PgtzS5T69m9B4yEZ0wgAm=6HxOSpwwMz95nBBXg@mail.gmail.com>
Subject: Re: [PATCH v6 1/2] dt-bindings: pinctrl: qcom: Add SDX65 pinctrl bindings
To:     quic_vamslank@quicinc.com
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        manivannan.sadhasivam@linaro.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Dec 17, 2021 at 12:19 AM <quic_vamslank@quicinc.com> wrote:

> From: Vamsi Krishna Lanka <quic_vamslank@quicinc.com>
>
> Add device tree binding Documentation details for Qualcomm SDX65
> pinctrl driver.
>
> Signed-off-by: Vamsi Krishna Lanka <quic_vamslank@quicinc.com>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

I applied this updated binding instead of the broken one
that I reverted a while back.

Yours,
Linus Walleij
