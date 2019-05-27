Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D3B1A2B10F
	for <lists+linux-gpio@lfdr.de>; Mon, 27 May 2019 11:10:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726560AbfE0JK3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 27 May 2019 05:10:29 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:46016 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726338AbfE0JK2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 27 May 2019 05:10:28 -0400
Received: by mail-lj1-f193.google.com with SMTP id r76so3247206lja.12
        for <linux-gpio@vger.kernel.org>; Mon, 27 May 2019 02:10:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pEGlKR9cMXvIeUwusBglsYeiQ+SPB2PmHYL6y3sHsr0=;
        b=FhjjRkkXUEVnfVIt6bTqWSZJb/80sf15Ilad86TcxGXBhK8aK4E1Q8KTgK9nZ7a3Wc
         L+08R9RZF08RtWFv83jca1VyQfwi7ljQUoGUnI+MLWoxcugHRvse2TEQADWqDxxGDhkv
         03VruCzQb3H2EC7bW3VH9sYFSU1DSddBsVfvpbfT+VLY9BvT7GtBotmkm3OzN5YNmVAG
         kO6OSAhPlVJGlX/tgBr5UHCMZEYKdewpzcS9XDXgV/Z2rjnIc5B86w2RLERHCubNoixu
         uI8Dtj9y6WlZ2f+MIDty1Q5bXXvSPYBMYwABhThGOV8v6RJF3aNCo0+PFKpKf3EFP0+Z
         kd1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pEGlKR9cMXvIeUwusBglsYeiQ+SPB2PmHYL6y3sHsr0=;
        b=f+OhRw8duFwFVn2YcFPqZfBWB/jvclkk8zIxBF1Q+YtGU8NhBWNpRNwmQIfcEIKjFn
         f4eoXLGCy9TLzXxL3Rt36uPl89umxM3KoyFlc+SFmkdnH0iBlTXHcbhZ7mdwKiqPGA1L
         l0nAl5DwE6KcbnI/q1OgK6nqoz6wGzPGLQxKmPfBgifrGCeMz+xGeEYFOrZo3puR2iXC
         XpNXn638EPg//jy4+UUfXncUgxpld7auhKHm2JZuJuXarnfD9A9XOsdRyNHT1caqZnXs
         OJP8/UpwItwYoDgNhQqdWIvYuSMIp5aS6WOyfam60sJ4VDNclsLxta53KFFzxxTs+XBP
         aVmA==
X-Gm-Message-State: APjAAAVwZHBxw/yGv2vP6qS+5ceekIFfreAPO26O+j9AcDY4BA4gyrf+
        6aDRt7Nia6aU5NacSPaOtEui+7rPehkA0IcjxfqpbA==
X-Google-Smtp-Source: APXvYqx3PadhULZkWPFoOWBCluXUOl+KRGzn+HWRbMqV3BUzCYyZIRy5UR/oJ53rjISdwLm4eqiipmAdUSlkYMpbwu0=
X-Received: by 2002:a2e:5c1:: with SMTP id 184mr52626256ljf.94.1558948227212;
 Mon, 27 May 2019 02:10:27 -0700 (PDT)
MIME-Version: 1.0
References: <20190525204228.8546-1-colin.king@canonical.com>
In-Reply-To: <20190525204228.8546-1-colin.king@canonical.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 27 May 2019 11:10:15 +0200
Message-ID: <CACRpkdadikx9MPrVUQxXa6KYsmnuoakjYVTNEcv_HOoW0pCgZg@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: pinctrl: fix spelling mistakes in pinctl documentation
To:     Colin King <colin.king@canonical.com>
Cc:     Andy Gross <agross@kernel.org>,
        David Brown <david.brown@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        MSM <linux-arm-msm@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, kernel-janitors@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, May 25, 2019 at 10:42 PM Colin King <colin.king@canonical.com> wrote:

> From: Colin Ian King <colin.king@canonical.com>
>
> The spelling of configured is incorrect in the documentation. Fix it.
>
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Patch applied with Bjorn's review tag.

Yours,
Linus Walleij
