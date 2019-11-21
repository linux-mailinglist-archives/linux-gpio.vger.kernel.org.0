Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3B81A105395
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Nov 2019 14:53:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726536AbfKUNxk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 21 Nov 2019 08:53:40 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:45245 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726293AbfKUNxk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 21 Nov 2019 08:53:40 -0500
Received: by mail-lj1-f195.google.com with SMTP id n21so3265937ljg.12
        for <linux-gpio@vger.kernel.org>; Thu, 21 Nov 2019 05:53:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=T1PuP4VfLVAgAH1rwCvjfUIifgOahXGW5a5nSozr7tM=;
        b=LsRF+WnD/fz1BhAJPqvcc7ugaaEYCn8jfsnmyT8OUeg2TWFCSX0nBr+u9Hz9IFXNxy
         DrAyBhQXEIP9WMjmLIAT3Q/KkgW6yr3x2hYbpseoAyMb0359Z+AS8UnE/wRpeg7xANoL
         xa2PtVzA1jCxSLqJ7X4JzX+bEmEVM35uTCUkhCjf2fsGoZ6z8OBNVQFt/evKmsxyPA67
         1WOvoPbJMAktaaMI8WOpK/A3nb8pKfQcr5elGaLB6bIw07rHrMFHnsbK1AuU/WWJpRLb
         5x8vfzLgsmM31VCsYiZVn+8xJIdgB9/AF57oVXHBO9CJI6IYg6vbPyM02HN5w+lWYqOU
         n4tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=T1PuP4VfLVAgAH1rwCvjfUIifgOahXGW5a5nSozr7tM=;
        b=HvyPYtVoeEXPvRVGsZLPW3M+e4WMNYny5gyd6H3rfqDbBQZaETqTITxX+8e3lcSVNt
         NSQM0/cz67MvR1+I207fGGsUcxrQZVFPREgBHcdDopYeBnaC+W3oZZaErZXXM8aas6Y3
         TAgUCPypJ7u75GIsrOfqIu2hwc6f20mckeZvHdavlDxLp3inN8oMRlsZysLCG8PczL8/
         raLCXQRF6OdLAZbNeUgXig34jL0kQCpP2bscAQp/SW1SzA9oNZnTKrjoftsKW4QoLOl3
         PaO98Fi6PcwqCOx3gpYnAyOryOmeOu0f6rDbEkIdosVAgJFrVsv0oWUCqsFZB3Qt6TJ4
         k8Nw==
X-Gm-Message-State: APjAAAWs3ZVZFA/LRQIbbyiOuBIoPk6tgzpx4RzZOC4wIPXjrqgsP78l
        USKcCF7C87/v847i97tVacOS/O2+i87HXmaNo7GHRA==
X-Google-Smtp-Source: APXvYqyGCA85Na7btrkKi+qMRlphfA0QGHjMWq+wQcUoMu0dMemrFCbVzha5zKB3wkOB5mHBvsygvRUkmNgOClwj+wY=
X-Received: by 2002:a2e:9699:: with SMTP id q25mr7550252lji.251.1574344418227;
 Thu, 21 Nov 2019 05:53:38 -0800 (PST)
MIME-Version: 1.0
References: <cover.1573797249.git.rahul.tanwar@linux.intel.com> <b59afc497e41404fea06aa48d633cba183ee944d.1573797249.git.rahul.tanwar@linux.intel.com>
In-Reply-To: <b59afc497e41404fea06aa48d633cba183ee944d.1573797249.git.rahul.tanwar@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 21 Nov 2019 14:53:26 +0100
Message-ID: <CACRpkdYZi-0LRjih8+2cgWZ6u-eFN5+3sW1eV2ujYRd0UBoEKQ@mail.gmail.com>
Subject: Re: [PATCH v8 2/2] dt-bindings: pinctrl: intel: Add for new SoC
To:     Rahul Tanwar <rahul.tanwar@linux.intel.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Rob Herring <robh@kernel.org>,
        Andriy Shevchenko <andriy.shevchenko@intel.com>,
        qi-ming.wu@intel.com, yixin.zhu@linux.intel.com,
        cheol.yong.kim@intel.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Nov 15, 2019 at 10:25 AM Rahul Tanwar
<rahul.tanwar@linux.intel.com> wrote:

> Add dt bindings document for pinmux & GPIO controller driver of
> Intel Lightning Mountain SoC.
>
> Signed-off-by: Rahul Tanwar <rahul.tanwar@linux.intel.com>

Patch applied, you worked hard to get these bindings done in the
right YAML format and all.

I have some generic bindings from Rob merged simultaneously
so it'd be great if you could investigate whether it is possible
to follow up with a patch to switch over from some of the local
grammar and toward including pinmux-node.yaml and
pincfg-node.yaml into these bindings.

The method for inclusion of external generic files can be seen
in e.g. the display panel bindings, like how
panel-common.yaml is included into other bindings under
display/panel/*.yaml.

Tell us if you have any problems with this!

Yours,
Linus Walleij
