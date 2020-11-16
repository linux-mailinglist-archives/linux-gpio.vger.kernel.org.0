Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A4D0F2B543E
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Nov 2020 23:23:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729562AbgKPWX2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 16 Nov 2020 17:23:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726016AbgKPWX1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 16 Nov 2020 17:23:27 -0500
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD2B8C0613D2
        for <linux-gpio@vger.kernel.org>; Mon, 16 Nov 2020 14:23:27 -0800 (PST)
Received: by mail-pf1-x443.google.com with SMTP id g7so15535773pfc.2
        for <linux-gpio@vger.kernel.org>; Mon, 16 Nov 2020 14:23:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to;
        bh=51GdHoPo70a17izsPbzqWOzN4LLPA5Lgx+6WUOC41Ug=;
        b=DFxTDidHweB7LP1g771S28roFVSSXluZ90YDgt4vfUvBabnO3roFhHGAN1sFK8GhxW
         ahea7T2Vpxp0h3p8dzvm7Ijr/hFdzxUVCPySRaD8Jv4SbH9TCIVGsPhPsm1EO53tlvy5
         CjmT+dOuXcAs8q9MnB46+jDr9P21InNL3213U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to;
        bh=51GdHoPo70a17izsPbzqWOzN4LLPA5Lgx+6WUOC41Ug=;
        b=WN1yynVaXs17+nb7Xo+4+uIVYvUvcTwIUI7xBHulktYoDRkDIFzHvf1myidUL8cBhn
         d2Jx+4FtHPkprz1DrJICQhT47tYLikRkrDNUwp6Y4KNUs9KcP2MNUrzzfSL+dyfN5iXr
         mqDZ6dikeYcpHPPQoRsCxWnQ1yfeTkBW7Y3JNGi7j4uOM6a5mHIYNVpIdHlImnkeo7np
         RkVYMXPyxjBbB2q4gsB07ABj9Zab9vKaJktRAMBdpdB+RKwdQ0KgH/zfRl0irm7PuvJa
         hbru0XKTFHfmxzpDZXVVIcEBZhqMHVLWKYe/Xd/ddvxsccXRa6Bg9R10UKvhCfD73ev5
         sijg==
X-Gm-Message-State: AOAM533VaZXijo9AvhB6RLdFtL8O4mZCV+baGrFcnSvzYDEGuOynwxXE
        8PmOjtwkFCWBeK+DEQ9JrUTFO8AHUaVWv+URGTk=
X-Google-Smtp-Source: ABdhPJx0Rrad471U4lc4EpQJGmCOMEatYbpv2RB0Crf9zvHbw1//Qd+WqBdXWQEhIn0Vtdg+bBovQg==
X-Received: by 2002:a63:df58:: with SMTP id h24mr1123205pgj.206.1605565406795;
        Mon, 16 Nov 2020 14:23:26 -0800 (PST)
Received: from [10.136.8.243] ([192.19.228.250])
        by smtp.gmail.com with ESMTPSA id mt2sm462274pjb.7.2020.11.16.14.23.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2020 14:23:26 -0800 (PST)
Subject: Re: [PATCH] pinctrl: bcm: pinctrl-iproc-gpio: Fix setting GPIO as
 output
To:     Mark Tomlinson <mark.tomlinson@alliedtelesis.co.nz>,
        rjui@broadcom.com, sbranden@broadcom.com
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20201116215842.29488-1-mark.tomlinson@alliedtelesis.co.nz>
From:   Ray Jui <ray.jui@broadcom.com>
Message-ID: <2d0ed323-d2c4-b60c-7f10-a313458e4656@broadcom.com>
Date:   Mon, 16 Nov 2020 14:23:24 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.3
MIME-Version: 1.0
In-Reply-To: <20201116215842.29488-1-mark.tomlinson@alliedtelesis.co.nz>
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
        boundary="000000000000c4c33705b440d349"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

--000000000000c4c33705b440d349
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 11/16/2020 1:58 PM, Mark Tomlinson wrote:
> When setting a GPIO pin to an output, it is important to set the value
> correctly before enabling the output so that a glitch is not seen on the
> pin. This glitch may be very short, but can be important if this is a
> reset signal.
> 
> Fixes: b64333ce769c ("pinctrl: cygnus: add gpio/pinconf driver")
> Signed-off-by: Mark Tomlinson <mark.tomlinson@alliedtelesis.co.nz>
> ---
>  drivers/pinctrl/bcm/pinctrl-iproc-gpio.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pinctrl/bcm/pinctrl-iproc-gpio.c b/drivers/pinctrl/bcm/pinctrl-iproc-gpio.c
> index e2bd2dce6bb4..cadcf5eb0466 100644
> --- a/drivers/pinctrl/bcm/pinctrl-iproc-gpio.c
> +++ b/drivers/pinctrl/bcm/pinctrl-iproc-gpio.c
> @@ -348,8 +348,8 @@ static int iproc_gpio_direction_output(struct gpio_chip *gc, unsigned gpio,
>  	unsigned long flags;
>  
>  	raw_spin_lock_irqsave(&chip->lock, flags);
> -	iproc_set_bit(chip, IPROC_GPIO_OUT_EN_OFFSET, gpio, true);
>  	iproc_set_bit(chip, IPROC_GPIO_DATA_OUT_OFFSET, gpio, !!(val));
> +	iproc_set_bit(chip, IPROC_GPIO_OUT_EN_OFFSET, gpio, true);
>  	raw_spin_unlock_irqrestore(&chip->lock, flags);
>  
>  	dev_dbg(chip->dev, "gpio:%u set output, value:%d\n", gpio, val);
> 

Thanks. The fix looks good. Would you be able to also help fix this in
pinctrl-nsp-gpio.c ?

Acked-by: Ray Jui <ray.jui@broadcom.com>

--000000000000c4c33705b440d349
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

MIIQMwYJKoZIhvcNAQcCoIIQJDCCECACAQExDzANBglghkgBZQMEAgEFADALBgkqhkiG9w0BBwGg
gg2IMIIE6DCCA9CgAwIBAgIOSBtqCRO9gCTKXSLwFPMwDQYJKoZIhvcNAQELBQAwTDEgMB4GA1UE
CxMXR2xvYmFsU2lnbiBSb290IENBIC0gUjMxEzARBgNVBAoTCkdsb2JhbFNpZ24xEzARBgNVBAMT
Ckdsb2JhbFNpZ24wHhcNMTYwNjE1MDAwMDAwWhcNMjQwNjE1MDAwMDAwWjBdMQswCQYDVQQGEwJC
RTEZMBcGA1UEChMQR2xvYmFsU2lnbiBudi1zYTEzMDEGA1UEAxMqR2xvYmFsU2lnbiBQZXJzb25h
bFNpZ24gMiBDQSAtIFNIQTI1NiAtIEczMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA
tpZok2X9LAHsYqMNVL+Ly6RDkaKar7GD8rVtb9nw6tzPFnvXGeOEA4X5xh9wjx9sScVpGR5wkTg1
fgJIXTlrGESmaqXIdPRd9YQ+Yx9xRIIIPu3Jp/bpbiZBKYDJSbr/2Xago7sb9nnfSyjTSnucUcIP
ZVChn6hKneVGBI2DT9yyyD3PmCEJmEzA8Y96qT83JmVH2GaPSSbCw0C+Zj1s/zqtKUbwE5zh8uuZ
p4vC019QbaIOb8cGlzgvTqGORwK0gwDYpOO6QQdg5d03WvIHwTunnJdoLrfvqUg2vOlpqJmqR+nH
9lHS+bEstsVJtZieU1Pa+3LzfA/4cT7XA/pnwwIDAQABo4IBtTCCAbEwDgYDVR0PAQH/BAQDAgEG
MGoGA1UdJQRjMGEGCCsGAQUFBwMCBggrBgEFBQcDBAYIKwYBBQUHAwkGCisGAQQBgjcUAgIGCisG
AQQBgjcKAwQGCSsGAQQBgjcVBgYKKwYBBAGCNwoDDAYIKwYBBQUHAwcGCCsGAQUFBwMRMBIGA1Ud
EwEB/wQIMAYBAf8CAQAwHQYDVR0OBBYEFGlygmIxZ5VEhXeRgMQENkmdewthMB8GA1UdIwQYMBaA
FI/wS3+oLkUkrk1Q+mOai97i3Ru8MD4GCCsGAQUFBwEBBDIwMDAuBggrBgEFBQcwAYYiaHR0cDov
L29jc3AyLmdsb2JhbHNpZ24uY29tL3Jvb3RyMzA2BgNVHR8ELzAtMCugKaAnhiVodHRwOi8vY3Js
Lmdsb2JhbHNpZ24uY29tL3Jvb3QtcjMuY3JsMGcGA1UdIARgMF4wCwYJKwYBBAGgMgEoMAwGCisG
AQQBoDIBKAowQQYJKwYBBAGgMgFfMDQwMgYIKwYBBQUHAgEWJmh0dHBzOi8vd3d3Lmdsb2JhbHNp
Z24uY29tL3JlcG9zaXRvcnkvMA0GCSqGSIb3DQEBCwUAA4IBAQConc0yzHxn4gtQ16VccKNm4iXv
6rS2UzBuhxI3XDPiwihW45O9RZXzWNgVcUzz5IKJFL7+pcxHvesGVII+5r++9eqI9XnEKCILjHr2
DgvjKq5Jmg6bwifybLYbVUoBthnhaFB0WLwSRRhPrt5eGxMw51UmNICi/hSKBKsHhGFSEaJQALZy
4HL0EWduE6ILYAjX6BSXRDtHFeUPddb46f5Hf5rzITGLsn9BIpoOVrgS878O4JnfUWQi29yBfn75
HajifFvPC+uqn+rcVnvrpLgsLOYG/64kWX/FRH8+mhVe+mcSX3xsUpcxK9q9vLTVtroU/yJUmEC4
OcH5dQsbHBqjMIIDXzCCAkegAwIBAgILBAAAAAABIVhTCKIwDQYJKoZIhvcNAQELBQAwTDEgMB4G
A1UECxMXR2xvYmFsU2lnbiBSb290IENBIC0gUjMxEzARBgNVBAoTCkdsb2JhbFNpZ24xEzARBgNV
BAMTCkdsb2JhbFNpZ24wHhcNMDkwMzE4MTAwMDAwWhcNMjkwMzE4MTAwMDAwWjBMMSAwHgYDVQQL
ExdHbG9iYWxTaWduIFJvb3QgQ0EgLSBSMzETMBEGA1UEChMKR2xvYmFsU2lnbjETMBEGA1UEAxMK
R2xvYmFsU2lnbjCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAMwldpB5BngiFvXAg7aE
yiie/QV2EcWtiHL8RgJDx7KKnQRfJMsuS+FggkbhUqsMgUdwbN1k0ev1LKMPgj0MK66X17YUhhB5
uzsTgHeMCOFJ0mpiLx9e+pZo34knlTifBtc+ycsmWQ1z3rDI6SYOgxXG71uL0gRgykmmKPZpO/bL
yCiR5Z2KYVc3rHQU3HTgOu5yLy6c+9C7v/U9AOEGM+iCK65TpjoWc4zdQQ4gOsC0p6Hpsk+QLjJg
6VfLuQSSaGjlOCZgdbKfd/+RFO+uIEn8rUAVSNECMWEZXriX7613t2Saer9fwRPvm2L7DWzgVGkW
qQPabumDk3F2xmmFghcCAwEAAaNCMEAwDgYDVR0PAQH/BAQDAgEGMA8GA1UdEwEB/wQFMAMBAf8w
HQYDVR0OBBYEFI/wS3+oLkUkrk1Q+mOai97i3Ru8MA0GCSqGSIb3DQEBCwUAA4IBAQBLQNvAUKr+
yAzv95ZURUm7lgAJQayzE4aGKAczymvmdLm6AC2upArT9fHxD4q/c2dKg8dEe3jgr25sbwMpjjM5
RcOO5LlXbKr8EpbsU8Yt5CRsuZRj+9xTaGdWPoO4zzUhw8lo/s7awlOqzJCK6fBdRoyV3XpYKBov
Hd7NADdBj+1EbddTKJd+82cEHhXXipa0095MJ6RMG3NzdvQXmcIfeg7jLQitChws/zyrVQ4PkX42
68NXSb7hLi18YIvDQVETI53O9zJrlAGomecsMx86OyXShkDOOyyGeMlhLxS67ttVb9+E7gUJTb0o
2HLO02JQZR7rkpeDMdmztcpHWD9fMIIFNTCCBB2gAwIBAgIMJQxqAs0uKXLnVqjWMA0GCSqGSIb3
DQEBCwUAMF0xCzAJBgNVBAYTAkJFMRkwFwYDVQQKExBHbG9iYWxTaWduIG52LXNhMTMwMQYDVQQD
EypHbG9iYWxTaWduIFBlcnNvbmFsU2lnbiAyIENBIC0gU0hBMjU2IC0gRzMwHhcNMjAwOTIxMTQz
MTQ3WhcNMjIwOTIyMTQzMTQ3WjCBhDELMAkGA1UEBhMCSU4xEjAQBgNVBAgTCUthcm5hdGFrYTES
MBAGA1UEBxMJQmFuZ2Fsb3JlMRYwFAYDVQQKEw1Ccm9hZGNvbSBJbmMuMRAwDgYDVQQDEwdSYXkg
SnVpMSMwIQYJKoZIhvcNAQkBFhRyYXkuanVpQGJyb2FkY29tLmNvbTCCASIwDQYJKoZIhvcNAQEB
BQADggEPADCCAQoCggEBAKn4hxAQIaUc/63CGGAfKpCpBLQZU/mobqbKwTdwXmkNVlWkldmfbV1C
wdSx9vgMN7hDrNLmOcurXjYSYT0seO6NLnsRvQ6lc2v92pqK7i8HwzTOL/b9z4XC5VnoYcHRuz75
IcF8U8x+x6Rq4UutUQgoQDREvwBcsCj6ZDNmxDaEyyIflO3+HYvjI2hpJFOd+Wt5H/l9Nq1r7OLj
jtK7Nlq1VqsruL98ME7ID5QhbF4tLGQgZEw250Sctjx8R8+zZPNxIIDREhAsGiupe5j3rEXDFv39
Gp3tsmw0Vz7IMJs6DQIm7T8CfIzeId1IIHcH02MbpO7m1Btzyz625FoBWF8CAwEAAaOCAcswggHH
MA4GA1UdDwEB/wQEAwIFoDCBngYIKwYBBQUHAQEEgZEwgY4wTQYIKwYBBQUHMAKGQWh0dHA6Ly9z
ZWN1cmUuZ2xvYmFsc2lnbi5jb20vY2FjZXJ0L2dzcGVyc29uYWxzaWduMnNoYTJnM29jc3AuY3J0
MD0GCCsGAQUFBzABhjFodHRwOi8vb2NzcDIuZ2xvYmFsc2lnbi5jb20vZ3NwZXJzb25hbHNpZ24y
c2hhMmczME0GA1UdIARGMEQwQgYKKwYBBAGgMgEoCjA0MDIGCCsGAQUFBwIBFiZodHRwczovL3d3
dy5nbG9iYWxzaWduLmNvbS9yZXBvc2l0b3J5LzAJBgNVHRMEAjAAMEQGA1UdHwQ9MDswOaA3oDWG
M2h0dHA6Ly9jcmwuZ2xvYmFsc2lnbi5jb20vZ3NwZXJzb25hbHNpZ24yc2hhMmczLmNybDAfBgNV
HREEGDAWgRRyYXkuanVpQGJyb2FkY29tLmNvbTATBgNVHSUEDDAKBggrBgEFBQcDBDAfBgNVHSME
GDAWgBRpcoJiMWeVRIV3kYDEBDZJnXsLYTAdBgNVHQ4EFgQUvUTLkCwFvnpejW/KGvdaDA31b+sw
DQYJKoZIhvcNAQELBQADggEBACMny/9Y1OPK7qwiBKBMt478eBgXnTlJ0J0HNebYcxN/l7fKIKMb
/eX/AQKIDsHeshmV2ekPU4yY/04veXx3QTgmE1bb4ksKEFEbU0LXlVPrnlgNn8M75cPymegn/2yU
r1+htd2eve3obmKc5Lrl0GP+4m72XxAOL687Aw5vRa4Lf294s+x4d+VRwUjoFTj9zyLhexWQuJv/
yX1HjSkrlIsRwi6DN0/ieL04O9aD1UNPlCC6akGnv4tgwlESh51M564qhonlfSW6La+L/aTIuQc0
88lq8s/VMBBGdc7176/v5TbNwEC/c5QYbp2n76rAmKKjhjwWmBk64yLT7CoIxk0xggJvMIICawIB
ATBtMF0xCzAJBgNVBAYTAkJFMRkwFwYDVQQKExBHbG9iYWxTaWduIG52LXNhMTMwMQYDVQQDEypH
bG9iYWxTaWduIFBlcnNvbmFsU2lnbiAyIENBIC0gU0hBMjU2IC0gRzMCDCUMagLNLily51ao1jAN
BglghkgBZQMEAgEFAKCB1DAvBgkqhkiG9w0BCQQxIgQgRT1WhFp0IFRoMuWE9BDJvhieqqvJ3Adm
klMxuGhs5I8wGAYJKoZIhvcNAQkDMQsGCSqGSIb3DQEHATAcBgkqhkiG9w0BCQUxDxcNMjAxMTE2
MjIyMzI3WjBpBgkqhkiG9w0BCQ8xXDBaMAsGCWCGSAFlAwQBKjALBglghkgBZQMEARYwCwYJYIZI
AWUDBAECMAoGCCqGSIb3DQMHMAsGCSqGSIb3DQEBCjALBgkqhkiG9w0BAQcwCwYJYIZIAWUDBAIB
MA0GCSqGSIb3DQEBAQUABIIBAA1PMYRDNgW1nsgXVKiFuEbBLSUvYj8c01knnxwJKbqlmG4zbA8h
Fx6WtFckidBqzagxb/kiT/RQI14JmN8W8zzXe3E40w/NE1LryMXz99OQsEbk3qu0D9VI2nO68vN+
v4/FT0iOKcP175SQiOwh+8o+NKFXanqfXV7uq7ZSv3vHaKCOZKypPHiSGHwqiA26LCJ8myO40dRk
3cgB+LuHoEDKwLf+kWGVOs94dxG2n3bAp4j/pFYC9Fdfguo/9f1Rnhy1UI6CHi1t7HVG0km7cWZn
olAIPYrEJChE9H04ZlpWlZDU9GWuj+uhGUUR0LjN+suI9vJcKF6gHlHnMhY5Pcs=
--000000000000c4c33705b440d349--
